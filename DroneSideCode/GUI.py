from tkinter import *
from tkinter import ttk
from PIL import Image, ImageTk
from PIL import ImageTk

root = Tk()
width ,height = 900,600
root.minsize(width,height)

frm = ttk.Frame(root, padding=200)
frm.grid()
ttk.Label(frm, text="Hello World!").grid(column=0, row=0)
ttk.Button(frm, text="Quit", command=root.destroy).grid(column=1, row=0)

image1 = Image.open("Recources\Images\photo.jpg")
test = ImageTk.PhotoImage(image1)
label1 = ttk.Label(image=test)
label1.image = test

# Position image
label1.place(x=width /2 - 100,y=height /2 - 100)
root.mainloop()