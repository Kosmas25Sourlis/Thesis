import cv2
import numpy as np
import face_recognition
def CompareFaces(frame, local_known_criminals, remaining_known_faces):
    face_locations = []
    face_encodings = []
    face_names = []
    frame_number = 0

    #face_locations = face_recognition.face_locations(frame, model="cnn")
    #face_encodings = face_recognition.face_encodings(frame, face_locations)




def LocateFace(img, local_known_criminals, remaining_known_faces):
    faceCascade = cv2.CascadeClassifier('haarcascade_fronatlface_default.xml')
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    rgb_frame = img[:, :, ::-1]
    faces = faceCascade.detectMultiScale(rgb_frame, 1.2 ,4)

    for (x,y,w,h) in faces:
        CompareFaces(rgb_frame, local_known_criminals, remaining_known_faces)
        cv2.rectangle(img,(x,y),(x+w, y+h) , (0,0,255),2)
        cv2.compare()
    return img
