from djitellopy import tello
import DroneControler as dc
from time import sleep, time
import cv2 as camera
import socket
import DatabaseRequests as dr
import face_recognition
from datetime import datetime
import VideoStream as stream
now = datetime.now()
global imageFrame
drone = tello.Tello()
drone.connect()
print(drone.get_battery())
drone.streamon()

local_criminalsURL = dr.GetPhotoURLsFromArea(2)
remainingAreas_criminalsURLs = dr.GetPhotoURLsFromRemainingAreas(2)

local_known_criminals = []
remaining_known_criminals = []
print(local_criminalsURL[0][0])
for element in local_criminalsURL:

    image1 = local_criminalsURL[0][0]
    image = face_recognition.load_image_file(image1)
    face_encoding = face_recognition.face_encodings(image)[0]
    local_known_criminals.append(face_encoding)




while True:
    instructions = dc.getKeyboardButtonPressed()
    stream.StreamVideo(drone, instructions['picture'], local_known_criminals, remaining_known_criminals)
    if instructions['launch'] == 1:
        drone.takeoff()
        sleep(1)
    elif instructions['land'] == 1:
        drone.land()
        sleep(1)
    drone.send_rc_control(instructions['left_right'], instructions['forward_backwards'], instructions['up_down'], instructions['rotateLeft_right'])
    sleep(0.05)
    print(instructions)
