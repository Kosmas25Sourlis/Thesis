import pygame

def initializeWindow():
    pygame.init()
    window = pygame.display.set_mode((600,600))

def getKey(keyName):
    ans = False
    for eve in pygame.event.get():pass
    keyinput = pygame.key.get_pressed()
    myKey = getattr(pygame , 'K_{}'.format(keyName))
    if keyinput[myKey]:
        ans = True
    pygame.display.update()

    return ans






