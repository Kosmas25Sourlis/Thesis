from tkinter import *
from tkinter import ttk
from PIL import Image, ImageTk
import DatabaseRequests as dr

def PopUpWindow(criminalData, id_criminal, photo_url):

    root = Tk()
    width, height = 1000,800
    root.minsize(width,height)
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()
    x_cordinate = int((screen_width/2) - (width/2))
    y_cordinate = int((screen_height/2) - (height/2))
    root.geometry("{}x{}+{}+{}".format(width, height, x_cordinate, y_cordinate))
    root.configure(bg='#7F7876')
    frm = ttk.Frame(root, padding=10)
    frm.grid()




    image1 = Image.open("Recources\Images\photo.jpg")
    image1 = image1.resize((300,350))
    test = ImageTk.PhotoImage(image1)
    image2 = Image.open("Recources\Images\Kosmas_Sourlis.jpg")
    image2 = image2.resize((300, 350))
    test2 = ImageTk.PhotoImage(image2)
    database_photo = ttk.Label(image=test2)
    drone_photo = ttk.Label(image=test)

    title = ttk.Label(text="Criminal Detected",font='Calibri 28 bold')
    criminal_data = ttk.Label(text="Criminal data " ,font='Calibri 14  bold')
    surname_criminal = ttk.Label(text="Surname: " + criminalData["surname_criminal"],font='Calibri 12  bold')
    first_name_criminal = ttk.Label(text="Name: " + criminalData["name_criminal"],font='Calibri 12  bold')
    age_criminal = ttk.Label(text="Age: " + criminalData["age_criminal"], font='Calibri 12  bold')
    criminal_gender = ttk.Label(text="Gender: " + criminalData["criminal_gender"], font='Calibri 12  bold')
    criminal_nationality = ttk.Label(text="Nationality: " + criminalData["nationality_criminal"], font='Calibri 12  bold')
    height_criminal = ttk.Label(text="Height: " + criminalData["height_criminal"], font='Calibri 12  bold')
    years_in_jail = ttk.Label(text="Years in jail: " + criminalData["years_in_jail"], font='Calibri 12  bold')
    residence = ttk.Label(text="Residence: ", font='Calibri 14  bold')
    country_residence_criminal = ttk.Label(text="Country: " + criminalData["country_residence_criminal"], font='Calibri 12  bold')
    town_criminal = ttk.Label(text="Town: " + criminalData["town_criminal_address"], font='Calibri 12  bold')
    zip_code_criminal = ttk.Label(text="Zip code: " + criminalData["zip_code_criminal"], font='Calibri 12  bold')
    street_criminal_address = ttk.Label(text="Street: " + criminalData["street_criminal_address"], font='Calibri 12  bold')
    type_of_residence_criminal = ttk.Label(text="Type of residence: " + criminalData["type_of_criminal_residence"], font='Calibri 12  bold')
    crimes = ttk.Label(text="Crimes: " +  criminalData["crimes"], font='Calibri 16  bold')
    victims = ttk.Label(text="Victims: ", font='Calibri 16  bold')
    label_database = ttk.Label(text="Database photo",font='Calibri 18  bold')
    label_drone = ttk.Label(text="Drone photo",font='Calibri 18  bold')
    # Position image
    database_photo.place(x=width /2  -175,y=height /2 -180)
    drone_photo.place(x=width /2+ 150,y=height /2 -180)
    title.place(x=width /2 -20,y=75)
    label_database.place(x=width /2 - 100,y=175)
    label_drone.place(x=width /2 +220,y=175)

    criminal_data.place(x=50, y=120)
    surname_criminal.place(x=50, y=160)
    first_name_criminal.place(x=50, y=190)
    age_criminal.place(x=50, y=220)
    criminal_gender.place(x=50, y=250)
    height_criminal.place(x=50, y=280)
    years_in_jail.place(x=50, y=310)
    criminal_nationality.place(x=50, y=340)
    residence.place(x=50, y=380)
    country_residence_criminal.place(x=50, y=420)
    town_criminal.place(x=50, y=450)
    zip_code_criminal.place(x=50, y=480)
    street_criminal_address.place(x=50, y=510)
    type_of_residence_criminal.place(x=50, y=540)
    crimes.place(x=50, y=600)
    victims.place(x=50, y=650)
    root.mainloop()

x={
    "name_criminal": " Kosmas",
    "surname_criminal": " Sourlis",
    "age_criminal": " 25",
    "height_criminal": " 1.93",
    "weight_criminal": " 100",
    "phone_criminal": " name",
    "criminal_gender": " Male",
    "nationality_criminal": " Greek",
    "years_in_jail": " 0",
    "country_residence_criminal": " Greece",
    "town_criminal_address": " Thessaloniki",
    "zip_code_criminal": " 58810",
    "street_criminal_address": " Ermou 20",
    "type_of_criminal_residence": " Permanent",
    "crimes": " Bank robbery, Aristotelous Thessaloniki",
    "victims": "-"
}

criminalslURL = dr.GetPhotoURLsFromArea(2)
print(criminalslURL[0][0])
PopUpWindow(x,2,2)