from djitellopy import tello
from time import sleep

import cv2 as camera

import socket
drone = tello.Tello()
drone.connect()

drone.streamon()
while True:

    imageFrame = drone.get_frame_read().frame
    imageFrame = camera.resize(imageFrame, (400, 400))
    camera.imshow("Image", imageFrame)
    camera.waitKey(1)
