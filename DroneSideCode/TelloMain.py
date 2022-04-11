from djitellopy import tello
import DroneControler as dc
from time import sleep, time
import cv2 as camera
import socket
from datetime import datetime
import VideoStream as stream
now = datetime.now()
global imageFrame
drone = tello.Tello()
drone.connect()
print(drone.get_battery())
drone.streamon()
while True:
    instructions = dc.getKeyboardButtonPressed()
    stream.StreamVideo(drone, instructions['picture'])
    if instructions['launch'] == 1:
        drone.takeoff()
        sleep(1)
    elif instructions['land'] == 1:
        drone.land()
        sleep(1)
    drone.send_rc_control(instructions['left_right'], instructions['forward_backwards'], instructions['up_down'], instructions['rotateLeft_right'])
    sleep(0.05)
    print(instructions)
