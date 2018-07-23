# -*- coding:utf-8 -*-
import os
import time
def changeImgName(path):
    global i
    if not os.path.isdir(path) and not os.path.isfile(path):
        return False
    if os.path.isfile(path):
        filePath = os.path.split(path)           #分割出目录与文件
        fileMsg = os.path.splitext(filePath[1]) #分割出文件与文件扩展名
        fileExt = fileMsg[1]                     #取出后缀名(列表切片操作)
        fileName = fileMsg[0]                       #取出文件名
        imgExtList = ['bmp','jpeg','gif','png','jpg'] #常见文件名
        if fileExt.strip('.') in imgExtList:
            os.rename(path, filePath[0]+os.sep+''+fileName.replace('-', '')+fileExt) #重命名
            i += 1
    elif os.path.isdir(path):#递归处理
        for x in os.listdir(path):
            changeImgName(os.path.join(path, x)) #os.path.join()路径处理

time.clock()
i = 0
changeImgName('/Users/gyy4pc/Desktop/try2/darkflow-master/MOT16/images')
print('程序运行耗时:%0.2f'%(time.clock()))
print('总共处理了 %s 张图片'%(i))
