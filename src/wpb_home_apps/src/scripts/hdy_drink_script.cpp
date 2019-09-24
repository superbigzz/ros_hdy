#include "hdy_drink_script.h"
CDrinkScript::CDrinkScript()
{
    
}

CDrinkScript::~CDrinkScript()
{

}

void CDrinkScript::Queue()
{
    stAct newAct;
    string str;

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "科大讯飞语音交互 Demo";
    newAct.nDuration = 5;
    arAct.push_back(newAct);
/*
    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "到";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    keyword = strListen.find("书房");
    if(keyword > 1)str = "书房";
    keyword = strListen.find("厨房");
    if(keyword > 1)str = "厨房";
    keyword = strListen.find("客厅");
    if(keyword > 1)str = "客厅";

    newAct.nAct = ACT_GOTO;
    newAct.strTarget = str;
    arAct.push_back(newAct);
*/

    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "小黑同学";
    newAct.nDuration = 5;
    arAct.push_back(newAct);
   
    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "你好,主人";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "到书房来";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "好的,爸爸，小黑马上去";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_GOTO;
    newAct.strTarget = "study";
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "爸爸，有什么吩咐吗";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "我渴了";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "好的,爸爸你想来瓶可乐吗";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "是的";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "好的,这就给您去取";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_GOTO;
    newAct.strTarget = "kitchen";
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "我到厨房啦";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_GOTO;
    newAct.strTarget = "study";
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "可乐已取回,爸爸请慢用";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_LISTEN;
    newAct.strTarget = "回客厅去";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "好的，爸爸";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_GOTO;
    newAct.strTarget = "living";
    arAct.push_back(newAct);

    newAct.nAct = ACT_OBJ_DET;
    newAct.strTarget = "";
    newAct.nDuration = 5;
    arAct.push_back(newAct);

    newAct.nAct = ACT_SPEAK;
    newAct.strTarget = "任务完成";
    newAct.nDuration = 5;
    arAct.push_back(newAct);
}