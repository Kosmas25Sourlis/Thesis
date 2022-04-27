# Python program for face
# comparison


import face_recognition
import cv2

image = face_recognition.load_image_file("Recources/Images\Kosmas_Sourlis.jpg")
face_encoding = face_recognition.face_encodings(image)[0]
known_faces = []


match = face_recognition.compare_faces(known_faces, photo_face, tolerance=0.50)






