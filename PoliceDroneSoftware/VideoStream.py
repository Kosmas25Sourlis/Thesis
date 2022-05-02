from djitellopy import tello
from time import sleep
import cv2 as camera
import socket
import FaceRecognition as fc
global imageFrame

def StreamVideo(drone, picture, local_known_criminals, remaining_known_criminals):
    imageFrame = drone.get_frame_read().frame
    imageFrame = camera.resize(imageFrame, (800, 600))
    imageFrame = fc.LocateFace(imageFrame, local_known_criminals, remaining_known_criminals)
    #fc.LocateFace2(imageFrame)
    camera.imshow("Image", imageFrame)
    camera.waitKey(1)
    if(picture == 1):
        photo = f'Recources\Images\photo.jpg'
        camera.imwrite(photo, imageFrame)
        sleep(0.3)
