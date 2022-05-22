import cv2
import numpy as np
from PIL import Image
import os
recognizer = cv2.face.LBPHFaceRecognizer_create()
face_detector = cv2.CascadeClassifier("haarcascade_frontalface_default.xml");
paths = ['./user_1_crop_images','./user_2_crop_images','./user_4_crop_images','./user_4_crop_images']
faceSamples = []
ids = []
for path in paths:
    photos = os.listdir(path)
    img_prefix_path = os.path.abspath(path)
    for photo in photos:

        img = Image.open(str(img_prefix_path) +'\\'+ photos[0]).convert('L')
        img_numpy = np.array(img, 'uint8')
        array_to_get_id = path.split('_')
        id = array_to_get_id[1][0]
        faces = face_detector.detectMultiScale(img_numpy)
        for (x, y, w, h) in faces:

            faceSamples.append(img_numpy[y:y + h, x:x + w])
            print(img_numpy[y:y + h, x:x + w])
            print()
            ids.append(int(id))

recognizer.train( faceSamples, np.array(ids))
# Save the model into trainer/zone1.yml
recognizer.write('trained_model/trainer.yml')
# Print the numer of faces trained and end program
print("\n [INFO] {0} faces trained. Exiting Program".format(len(np.unique(ids))))

# Path for face image database
#path = 'dataset'
#detector = cv2.CascadeClassifier("haarcascade_frontalface_default.xml");
# function to get the images and label data
#def getImagesAndLabels(path):
    #imagePaths = [os.path.join(path,f) for f in os.listdir(path)]
    ##ds = []
    #for imagePath in imagePaths:
        #PIL_img = Image.open(imagePath).convert('L') # grayscale
        #img_numpy = np.array(PIL_img,'uint8')
        #id = int(os.path.split(imagePath)[-1].split(".")[1])
        #faces = detector.detectMultiScale(img_numpy)
        #for (x,y,w,h) in faces:
           # faceSamples.append(img_numpy[y:y+h,x:x+w])
           # ids.append(id)
  #  return faceSamples,ids
#print ("\n [INFO] Training faces. It will take a few seconds. Wait ...")
#faces,ids = getImagesAndLabels(path)
#recognizer.train(faces, np.array(ids))
# Save the model into trainer/trainer.yml
#recognizer.write('trainer/trainer.yml')
# Print the numer of faces trained and end program
#print("\n [INFO] {0} faces trained. Exiting Program".format(len(np.unique(ids))))