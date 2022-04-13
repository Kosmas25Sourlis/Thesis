from tkinter import *
from tkinter import ttk
from PIL import Image, ImageTk
from PIL import ImageTk

root = Tk()
width,height = 1000,800
root.minsize(width,height)
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
x_cordinate = int((screen_width/2) - (width/2))
y_cordinate = int((screen_height/2) - (height/2))
root.geometry("{}x{}+{}+{}".format(width, height, x_cordinate, y_cordinate))
root.configure(bg='#7F7876')
frm = ttk.Frame(root, padding=10)
frm.grid()


ttk.Label(frm, text="Hello World!").grid(column=0, row=0)
ttk.Button(frm, text="Quit", command=root.destroy).grid(column=1, row=0)

image1 = Image.open("Recources\Images\photo.jpg")

image1 = image1.resize((300,350))
test = ImageTk.PhotoImage(image1)
database_photo = ttk.Label(image=test)
drone_photo = ttk.Label(image=test)

title = ttk.Label(text="Criminal Detected",font='Calibri 28  bold')
label_database = ttk.Label(text="Database photo",font='Calibri 18  bold')
label_drone = ttk.Label(text="Drone photo",font='Calibri 18  bold')

# Position image
database_photo.place(x=width /2  -175,y=height /2 -180)
drone_photo.place(x=width /2+ 150,y=height /2 -180)
title.place(x=width /2 -20,y=75)
label_database.place(x=width /2 - 100,y=175)
label_drone.place(x=width /2 +220,y=175)
root.mainloop()