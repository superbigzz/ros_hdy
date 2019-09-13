
详细的说明文档：

 - http://www.ncnynl.com/archives/201611/1069.html


xf-ros 说明


<code>
@author ncnynl <1043931@qq.com>
@time   2016-11-12
@website  http://www.ncnynl.com [创客智造]
</code>




说明：

 - 这个ROS软件包是科大讯飞的Linux版本的语音SDK接口DEMO集成到ROS

要求：

 - 需要到科大讯飞网站注册帐号(只需要APPID)
 - 下载linux版本ROS软件包，已经包含需要SDK库文件　 
 - 安装语音库：sudo apt-get install libasound2-dev (需要用到作为录音)


安装依赖：

    $ sudo apt-get update
    $ sudo apt-get install libasound2-dev 


下载：
<code>
$ cd ~   
$ git clone https://github.com/ncnynl/xf-ros.git
$ cp -R xf-ros/xfei_asr  ~/catkin_ws/src/
</code>

修改CMakelist.txt：
<code>
target_link_libraries(
   asr_sample
   ${catkin_LIBRARIES} 
   /home/ubu/catkin_ws/src/xfei_asr/lib/libmsc.so -ldl -pthread
 )
</code>

 - 找到所有的target_link_libraries，修改/home/ubu/catkin_ws为你自己的工作空间/home/xxxx/catkin_ws

修改代码：

 - 找到 *.c 和*.cpp文件中查找appid = 58249817，替换58249817为你自己申请的APPID.
 

编译：

    $ cd ~/catkin_ws/
    $ catkin_make

文件结构：

ubu@ubu:~/xf-ros/xfei_asr$ tree


使用说明：

1. 进入包的源目录：

    $ roscd xfei_asr/src 

2. 执行SDK DEMO, 目前可用：asr_sample、iat_sample、iat_record

    $ rosrun xfei_asr asr_sample
    $ rosrun xfei_asr iat_sample
    $ rosrun xfei_asr iat_record


3. 运行ROS DEMO，目前可用：tts_subscribe_speak、iat_publish_speak

    $ rosrun xfei_asr  tts_subscribe_speak
    $ rosrun xfei_asr  iat_publish_speak


4. tts_subscribe_speak详细使用：

- 新开终端1：

    $ roscore 

- 新开终端2：

    $ rosrun xfei_asr  tts_subscribe_speak

- 新开终端3：

    $ rostopic pub xfwords std_msgs/String "测试ncnynl.com"

- 效果：查看终端2的输出，并听到播放对应的文字。


 
5. iat_publish_speak详细使用：

- 新开终端1：
 
    $ roscore 
 
- 新开终端2: (订阅xfwakeup主题，发布xfspeech主题和xfwords主题)

    $ rosrun xfei_asr  iat_publish_speak

- 新开终端3：（xfspeech主题是录音专成的文字）

    $ rostopic echo /xfspeech
 
- 新开终端4：（xfwords主题是错误提示文字）

    $ rostopic echo /xfwords
 
- 新开终端5：（xfwakeup主题是唤醒功能，每发一次就可以录音一次。）

    $ rostopic pub xfwakeup std_msgs/String "ok"


参考：

 - http://www.ncnynl.com 
 - http://www.xfyun.cn/
 - http://blog.csdn.net/zhouge94/article/details/52028698

