import mysql.connector
con=mysql.connector.connect(
  host="localhost", user="root",
  password="", database="CRIMES")

# assign data query

def ConnectTodatabase():
  con = mysql.connector.connect(host="localhost", user="root",password="", database="audio_player")
  return con

def GetAreaCriminals(con , area):
  cursor = con.cursor()
  query1 = "select * from songs"
  kari = cursor.execute(query1)
  table = cursor.fetchall()

  def GetCriminalData():
    return








