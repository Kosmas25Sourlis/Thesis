from djitellopy import tello
import DroneControler as dc
from time import sleep
import cv2 as camera
import socket

drone = tello.Tello()
drone.connect()
print(drone.get_battery())
drone.streamon()
while True:
    imageFrame = drone.get_frame_read().frame
    imageFrame = camera.resize(imageFrame, (1200, 700))
    camera.imshow("Image", imageFrame)
    camera.waitKey(1)
    instructions = dc.getKeyboardButtonPressed()
    if instructions['launch'] == 1:
        drone.takeoff()
        sleep(2)
    elif instructions['land'] == 1:
        drone.land()
        sleep(2)
    drone.send_rc_control(instructions['left_right'], instructions['forward_backwards'], instructions['up_down'], instructions['rotateLeft_right'])
    sleep(0.05)
    print(instructions)





