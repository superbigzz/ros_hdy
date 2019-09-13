#include <ros/ros.h>
#include <iostream>
#include <python2.7/Python.h>


int main()
{
    Py_Initialize();
 
    PyRun_SimpleString("print 'test simple demo'");
	//load python functions 
    PyRun_SimpleString("import sys");
    //PyRun_SimpleString("import rospy");
    
    PyRun_SimpleString("from sensor_msgs.msg import Image as ROSImage");
    /*
    from sensor_msgs.msg import CompressedImage
    from cv_bridge import CvBridge
    import cv2
    import matplotlib
    import numpy as np
    import os
    import six.moves.urllib as urllib
    import sys
    import tarfile
    import tensorflow as tf
    import zipfile
    */
    /*
    std::string path = "~/catkin_ws";
    std::string chdir_cmd = std::string("sys.path.append(\"") + path + "\")";
    std::cout << chdir_cmd << std::endl;
    const char* cstr_cmd = chdir_cmd.c_str();
    PyRun_SimpleString("import sys");
    PyRun_SimpleString(cstr_cmd);
    */

    //std::string dirs = std::string("sys.path.append('/home/hdy/catkin_ws/src/tensorflow_object_detection/scripts/')");
    std::string dirs = std::string("sys.path.append('/home/hdy/catkin_ws/')");
    PyRun_SimpleString(dirs.c_str());
    //load module
    //PyObject *module = PyString_FromString("hdy_test");
    PyObject *module = PyString_FromString("ros_tensorflow_object_detection");
    if(!module) //failed
    {
        std::cout << "Get add_test failed." << std::endl;
        return 0;
    }
    PyObject *pyModule = PyImport_Import(module);
    if(!pyModule) //failed
    {
        std::cout << "Get python module failed." << std::endl;
        return 0;
    }
    //load function
    PyObject *pyfun = PyObject_GetAttrString(pyModule, "main");
    if(!pyfun) std::cout << "!pyfun" << std::endl;
    if(!PyCallable_Check(pyfun)) std::cout << "!PyCallable_Check(pyfun)" << std::endl;
    if(!pyfun || !PyCallable_Check(pyfun))
    {
        std::cout << "Cannot find python function" << std::endl;
        return 0;
    }else{
        std::cout << "load python funtion ok" << "\n";
    }
    //PyEval_CallObject(pyfun, NULL);
    /*
    // 设置参数
    PyObject* args = PyTuple_New(2);   // 2个参数
    PyObject* arg1 = PyInt_FromLong(4);    // 参数一设为4
    PyObject* arg2 = PyInt_FromLong(3);    // 参数二设为3
    PyTuple_SetItem(args, 0, arg1);
    PyTuple_SetItem(args, 1, arg2);

    // 调用函数
    PyObject* pRet = PyObject_CallObject(pyfun, args);

    // 获取参数
    if (pRet)  // 验证是否调用成功
    {
        long result = PyInt_AsLong(pRet);
        std::cout << "result:" << result;
    }
    */
    //callback funtion
    PyObject *argss = PyTuple_New(1);
    PyObject *arg = PyString_FromString("127.0.0.1");
    PyTuple_SetItem(argss, 0, arg);
    PyObject *pyRes = PyObject_CallObject(pyfun, argss);
    //get result
    if(pyRes)
    {
        std::string ret = PyString_AsString(pyRes);
        std::cout << "result: " << ret << "\n";
    }

    Py_Finalize();
    return 0;
}