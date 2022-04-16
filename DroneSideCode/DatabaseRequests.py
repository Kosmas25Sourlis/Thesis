import mysql.connector

def ConnectTodatabase():
  con = mysql.connector.connect(host="localhost", user="root",password="", database="crimes")
  return con

def GetCrimeAreaIDsInZone(zone_id , con , nearest):

  cursor = con.cursor()
  crimes_in_area_query = ""
  if(nearest == True):
    crimes_in_area_query = "select Area_ID from crime_area where Zone_ID = '" + str(zone_id) + "'"
  else:
    crimes_in_area_query = "select Area_ID from crime_area where Zone_ID != '" + str(zone_id) + "'"
  cursor.execute(crimes_in_area_query)
  results = cursor.fetchall()
  return results


def GetCrimeIDsWithAreaIDs(areaIDs , con):
  cursor = con.cursor()
  crimes_in_area_query = "select CrimeID from crime_records where Area_ID = '" + str(areaIDs[0][0]) + "'"
  for areaID in areaIDs[1:]:
    crimes_in_area_query += " OR Area_ID = '" + str(areaID[0]) + "'"
  cursor.execute(crimes_in_area_query)
  results = cursor.fetchall()
  return results

def GetCriminalIDs(crimeIDs, con):
  cursor = con.cursor()
  criminal_IDs_query = "select CriminalID from criminals where CrimeID = '" + str(crimeIDs[0][0]) + "'"
  for ID in crimeIDs[1:]:
    criminal_IDs_query += " OR CrimeID = '" + str(ID[0]) + "'"
  cursor.execute(criminal_IDs_query)
  results = cursor.fetchall()
  return results

def GetCriminalUrld(criminaIDs, con):
  cursor = con.cursor()
  criminal_URLs_query = "select PhotoURL from people where Person_ID = '" + str(criminaIDs[0][0]) + "'"
  for ID in criminaIDs[1:]:
    criminal_URLs_query += " OR Person_ID = '" + str(ID[0]) + "'"
  cursor.execute(criminal_URLs_query)
  results = cursor.fetchall()
  return results

def GetPhotoURLsFromArea(zone):
  con = ConnectTodatabase()
  crimeAreas = GetCrimeAreaIDsInZone(zone, con , True)
  crimeIDs = GetCrimeIDsWithAreaIDs(crimeAreas, con)
  criminalIDs = GetCriminalIDs(crimeIDs, con)
  criminalslURL = GetCriminalUrld(crimeIDs, con)
  return criminalslURL

def GetPhotoURLsFromRemainingAreas(zone):
  con = ConnectTodatabase()
  crimeAreas = GetCrimeAreaIDsInZone(zone, con , False)
  crimeIDs = GetCrimeIDsWithAreaIDs(crimeAreas, con)
  criminalIDs = GetCriminalIDs(crimeIDs, con)
  criminalslURL = GetCriminalUrld(crimeIDs, con)
  return criminalslURL




