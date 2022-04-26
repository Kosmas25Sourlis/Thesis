import cv2
import numpy as np

def LocateFace(img):
    faceCascade = cv2.CascadeClassifier('haarcascade_fronatlface_default.xml')
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = faceCascade.detectMultiScale(imgGray, 1.2 ,4)

    for (x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w, y+h) , (0,0,255),2)



    return img
