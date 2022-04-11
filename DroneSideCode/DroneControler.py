

import KeyboardControl as dc

dc.initializeWindow()

def getKeyboardButtonPressed():
    controls = {
        "up_down": 0,
        "forward_backwards": 0,
        "left_right": 0,
        "rotateLeft_right": 0,
        "launch": 0,
        "land": 0,
        "picture": 0
    }
    if dc.getKey('p'):
        controls["picture"] = 1
    if dc.getKey('q'):
        controls["launch"] = 1
    if dc.getKey('e'):
        controls["land"] = 1
    if dc.getKey('UP'):
        controls["up_down"] = 100
    if dc.getKey('DOWN'):
        controls["up_down"] = -40
    if dc.getKey('w'):
        controls["forward_backwards"] = 100
    if dc.getKey('s'):
        controls["forward_backwards"] = -100
    if dc.getKey('a'):
        controls["left_right"] = -40
    if dc.getKey('d'):
        controls["left_right"] = 40
    if dc.getKey('LEFT'):
        controls["rotateLeft_right"] = -40
    if dc.getKey('RIGHT'):
        controls["rotateLeft_right"] = 40

    return controls

