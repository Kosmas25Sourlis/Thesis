import os
from PIL import Image
import cv2
# All files and directories ending with .txt and that don't begin with a dot:
photos = os.listdir('./user_2_Pre_crop_images')
face_detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
recognizer = cv2.face.LBPHFaceRecognizer_create()
for img in photos:
    imgpath = img
    image = cv2.imread('C:\\Users\kosma\\Desktop\\Thesis\PoliceDroneSoftware\\user_2_Pre_crop_images\\' + imgpath)
    #image = cv2.flip(image, -1)  # flip video image vertically
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_detector.detectMultiScale(gray, 1.3, 5)
    for (x,y,w,h) in faces:
        cv2.rectangle(image, (x,y), (x+w,y+h), (255,0,0), 2)
        cv2.imwrite('C:\\Users\kosma\\Desktop\\Thesis\PoliceDroneSoftware\\user_2_crop_images\\' + imgpath, gray[y:y+h,x:x+w])
