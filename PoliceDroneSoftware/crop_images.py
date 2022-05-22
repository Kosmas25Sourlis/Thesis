import os
from PIL import Image
import cv2
photos = os.listdir('./user_2_Pre_crop_images')
face_detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
for img in photos:
    imgpath = img
    image = cv2.imread('\\PoliceDroneSoftware\\user_2_Pre_crop_images\\' + imgpath)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    faces = face_detector.detectMultiScale(gray, 1.3, 5)
    for (x,y,w,h) in faces:
        cv2.rectangle(image, (x,y), (x+w,y+h), (255,0,0), 2)
        cv2.imwrite('\\PoliceDroneSoftware\\user_2_crop_images\\' + imgpath, gray[y:y+h,x:x+w])
