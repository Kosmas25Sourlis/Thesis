import cv2
import numpy as np
import os
import random
import time

recognizer = cv2.face.LBPHFaceRecognizer_create()
recognizer.read('trained_model/trainer.yml')
cascadePath = "haarcascade_frontalface_default.xml"
faceCascade = cv2.CascadeClassifier(cascadePath)
font = cv2.FONT_HERSHEY_SIMPLEX

names = ['0', 'Kosmas', 'Thanasis', '55', 'ELina', 'W']

x = random.random()

# generates a random int


# generates a random int in a range

def LocateFace2(img):

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    face_detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    faces = face_detector.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in faces:
        milliseconds = int(round(time.time() * 1000))
        length = (len( os.listdir('./user_4_crop_images')))
        if (length < 65):
            cv2.imwrite("user_4_crop_images/User_4_" +str(milliseconds) + ".jpg", gray[y:y + h, x:x + w])


def LocateFace(img, local_known_criminals, remaining_known_faces):

    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    #rgb_frame = img[:, :, ::-1]
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = faceCascade.detectMultiScale(imgGray, 1.2, 4)
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

    for (x,y,w,h) in faces:

        #CompareFaces(rgb_frame, local_known_criminals, remaining_known_faces)

        cv2.rectangle(img, (x, y), (x+w, y+h), (0, 0, 255), 2)
        id, confidence = recognizer.predict(gray[y:y+h, x:x+w])
        # If confidence is less them 100 ==> "0" : perfect match
        if (confidence < 100):
            print(id)
            id = names[id]
            confidence = "  {0}%".format(round(100 - confidence))
        else:
            id = "unknown"
            confidence = "  {0}%".format(round(100 - confidence))

        cv2.putText(
            img,
            str(id),
            (x + 5, y - 5),
            font,
            1,
            (255, 255, 255),
            2
        )
        cv2.putText(
            img,
            str(confidence),
            (x + 5, y + h - 5),font,1, (255, 255, 0),1)
    return img
