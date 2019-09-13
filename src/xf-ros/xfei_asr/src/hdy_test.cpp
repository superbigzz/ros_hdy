/*
* xf_asr_node
* xf_asr.cpp
* 语音听写(iFly Auto Transform)技术能够实时地将语音转换成对应的文字。
*/
 
#include<ros/ros.h>
#include<std_msgs/String.h>
#include<std_msgs/Int32.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "qisr.h"
#include "msp_cmn.h"
#include "msp_errors.h"
#include "speech_recognizer.h"
 
#define FRAME_LEN   640
#define BUFFER_SIZE 4096
#define ASRFLAG     1
 
using namespace std;
 
bool flag = false;
bool recorder_Flag = true;
string result = "";
 
/* Upload User words */
static int upload_userwords()
{
    char*           userwords   =   NULL;
    size_t          len         =   0;
    size_t          read_len    =   0;
    FILE*           fp          =   NULL;
    int             ret         =   -1;
 
    fp = fopen("userwords.txt", "rb");
    if (NULL == fp)
    {
        printf("\nopen [userwords.txt] failed! \n");
        goto upload_exit;
    }
 
    fseek(fp, 0, SEEK_END);
    len = ftell(fp);
    fseek(fp, 0, SEEK_SET);
 
    userwords = (char*)malloc(len + 1);
    if (NULL == userwords)
    {
        printf("\nout of memory! \n");
        goto upload_exit;
    }
 
    read_len = fread((void*)userwords, 1, len, fp);
    if (read_len != len)
    {
        printf("\nread [userwords.txt] failed!\n");
        goto upload_exit;
    }
    userwords[len] = '\0';
 
    MSPUploadData("userwords", userwords, len, "sub = uup, dtt = userword", &ret); //ÉÏ´«ÓÃ»§´Ê±í
    if (MSP_SUCCESS != ret)
    {
        printf("\nMSPUploadData failed ! errorCode: %d \n", ret);
        goto upload_exit;
    }
 
upload_exit:
    if (NULL != fp)
    {
        fclose(fp);
        fp = NULL;
    }
    if (NULL != userwords)
    {
        free(userwords);
        userwords = NULL;
    }
 
    return ret;
}
 
 
static void show_result(char *str, char is_over)
{
    printf("\rResult: [ %s ]", str);
    if(is_over)
        putchar('\n');
    string s(str);
    result = s;
    flag = true;                        //设置发布话题为真
}
 
static char *g_result = NULL;
static unsigned int g_buffersize = BUFFER_SIZE;
 
void on_result(const char *result, char is_last)
{
    if (result) {
        size_t left = g_buffersize - 1 - strlen(g_result);
        size_t size = strlen(result);
        if (left < size) {
            g_result = (char*)realloc(g_result, g_buffersize + BUFFER_SIZE);
            if (g_result)
                g_buffersize += BUFFER_SIZE;
            else {
                printf("mem alloc failed\n");
                return;
            }
        }
        strncat(g_result, result, size);
        show_result(g_result, is_last);
    }
}
void on_speech_begin()
{
    if (g_result)
    {
        free(g_result);
    }
    g_result = (char*)malloc(BUFFER_SIZE);
    g_buffersize = BUFFER_SIZE;
    memset(g_result, 0, g_buffersize);
 
    printf("Start Listening...\n");
}
void on_speech_end(int reason)
{
    if (reason == END_REASON_VAD_DETECT)
    {
        printf("\nSpeaking done \n");
        recorder_Flag = false;
    }
    else
        printf("\nRecognizer error %d\n", reason);
}
 
/* demo recognize the audio from microphone */
static void demo_mic(const char* session_begin_params)
{
    int errcode;
    int i = 0;
 
    struct speech_rec iat;
 
    struct speech_rec_notifier recnotifier = {
        on_result,
        on_speech_begin,
        on_speech_end
    };
 
    errcode = sr_init(&iat, session_begin_params, SR_MIC, &recnotifier);
    if (errcode) {
        printf("speech recognizer init failed\n");
        return;
    }
    errcode = sr_start_listening(&iat);
    if (errcode) {
        printf("start listen failed %d\n", errcode);
    }
    /* demo 15 seconds recording */
    while(recorder_Flag)
    {
       sleep(1);
    }
    errcode = sr_stop_listening(&iat);
    if (errcode) {
        printf("stop listening failed %d\n", errcode);
    }
 
    sr_uninit(&iat);
}
 
/*
*    打开麦克风 录音 发送到服务器
*/
void asrProcess()
{
    int ret = MSP_SUCCESS;
    int upload_on = 1; /* whether upload the user word */
    /* login params, please do keep the appid correct */
    const char* login_params = "appid = 57f49f64, work_dir = .";
 
    /*
    * See "iFlytek MSC Reference Manual"
    */
    const char* session_begin_params =
        "sub = iat, domain = iat, language = zh_cn, "
        "accent = mandarin, sample_rate = 16000, "
        "result_type = plain, result_encoding = utf8";
 
    /* Login first. the 1st arg is username, the 2nd arg is password
     * just set them as NULL. the 3rd arg is login paramertes
     * */
    ret = MSPLogin(NULL, NULL, login_params);
    if (MSP_SUCCESS != ret) {
        printf("MSPLogin failed , Error code %d.\n",ret);
        goto exit; // login fail, exit the program
    }
 
/*
    if (upload_on)
    {
        printf("Uploading the user words ...\n");
        ret = upload_userwords();
        if (MSP_SUCCESS != ret)
            goto exit;
        printf("Uploaded successfully\n");
    }
*/
 
        demo_mic(session_begin_params);
 
exit:
    MSPLogout(); // Logout...
}
 
/*
*   根据发布的话题来修改录音标志
*/
void asrCallBack(const std_msgs::Int32::ConstPtr &msg)
{
 
        ROS_INFO_STREAM("Topic is Subscriber");
        if(msg->data == ASRFLAG)
        {
           asrProcess();
        }
}
 
/* main thread: start/stop record ; query the result of recgonization.
 * record thread: record callback(data write)
 * helper thread: ui(keystroke detection)
 */
int main(int argc, char* argv[])
{
    ros::init(argc, argv, "xf_asr_node");
    ros::NodeHandle nd;
 
    ros::Subscriber sub = nd.subscribe("/voice/xf_asr_topic", 1, asrCallBack);
    ros::Publisher pub = nd.advertise<std_msgs::String>("/voice/tuling_arv_topic", 3);
 
    ros::Rate loop_rate(10);
 
    while(ros::ok())
    {
        if(flag)
        {
            std_msgs::String msg;
            msg.data = result;
            pub.publish(msg);
            flag = false;
            recorder_Flag = true;
        }
 
      ros::spinOnce();
      loop_rate.sleep();
    }
 
 
    return 0;
}