import sqlite3
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, render_template, request
import sqlite3 as sql

conn = sqlite3.connect('Group15.db')
print ("Opened database successfully")

#Home Page
app = Flask(__name__)
@app.route('/')
def flight_home():
   return render_template('flight_home.html')

@app.route('/Showstats',methods = ['POST', 'GET'])
def Showstats():
   if request.method == 'POST':
      try:
         flight_nm = request.form['flight_nm']
         flight_num = request.form['flight_num']
         oa = request.form['oa']
         Depart_dt = request.form['Depart_dt']

         with sql.connect("Group15.db") as conn:
            conn = sql.connect("Group15.db")

            conn.row_factory = sql.Row
            cur = conn.cursor()
            cur.execute('''select flightresultid, 
    airportcode as trial_city_nm, 
    trial_airlinename_2 as airline_nm, 
    flightmonth, 
    trial_flightdayofmonth_5, 
    trial_percentdelayed_6, 
    percentcancelled 
FROM flightresult f
    INNER JOIN city c
        on (f.trial_cityid_2=c.cityid)
    INNER JOIN AIRLINE A
        ON (F.airlineid=A.airlineid)
WHERE trial_airlinename_2=trim("'''+flight_nm+'''") 
                        AND airportcode =trim("'''+oa+'''") 
                        and flightmonth=cast(substr(trim("'''+Depart_dt+'''"),6,2) as intger)
                        and trial_flightdayofmonth_5=cast(substr(trim("'''+Depart_dt+'''"),9,2) as integer)
                        ''')
            rows = cur.fetchall(); 

      except:
         conn = sql.connect("Group15.db")
         conn.rollback()
         msg = "error in insert operation"
      
      finally:
         return render_template("list_status_v2.html",rows = rows)
         con.close()

@app.route('/enternew_flight')
def new_student():
   return render_template('flight_add.html')

@app.route('/addrec',methods = ['POST', 'GET'])
def addrec():

   if request.method == 'POST':
      try:
         flight_nm = request.form['flight_nm']
         flight_num = request.form['flight_num']
         oa = request.form['oa']
         da = request.form['da']
            #status = request.form['status']
         sdt=request.form['sdt']
         adt=request.form['adt']
         Depart_dt = request.form['Depart_dt']
         dt_trial_flightmonth_7=Depart_dt[5:7]
         dt_dayofmonth=Depart_dt[8:10]
         #dt_trial_flightmonth_7=7
         #dt_dayofmonth=1
         if adt.lower()=='cancelled':
            trial_iscancelled_9_ind='Y' 
         else: 
            trial_iscancelled_9_ind='N'
         
         if adt.lower()=='diverted':
            trial_isdiverted_10_ind='Y' 
         else: 
            trial_isdiverted_10_ind='N'
         
         conn = sql.connect("Group15.db")
         cur = conn.cursor()
         cur.execute("select max(flightid)+1 from flightraw")
         maxval=cur.fetchone()[0]
         #print(maxval)

         with sql.connect("Group15.db") as con:
            cur = con.cursor()
            con.execute("INSERT INTO flightraw (flightid,airlineid,trial_departurecity_3,arrivalcity,flightnum,trial_flightdate_6,trial_flightmonth_7,dayofmonth,trial_iscancelled_9,trial_isdiverted_10,depdelayminutes ) VALUES (?,?,?,?,?,?,?,?,?,?,?)",(maxval,flight_num,da,oa,flight_num,Depart_dt,dt_trial_flightmonth_7,dt_dayofmonth,trial_iscancelled_9_ind,trial_isdiverted_10_ind,sdt ))
            con.commit()
            msg = "Record successfully added"
      except:
         con = sql.connect("Group15.db")
         con.rollback()
         msg = "error in insert operation"
      
      finally:
         return render_template("flight_result.html",msg = msg)
         con.close()

#############################Remove flight info
@app.route('/remove_flight')
def remove_flight():
   con = sql.connect("Group15.db")
   con.row_factory = sql.Row
   
   cur = con.cursor()
   cur.execute('''select flightid,
  f.airlineid,
  trial_airlinename_2 as airline_nm,    
  trial_departurecity_3,
  airportcode as departure_airport_code, 
  arrivalcity,
  flightnum,
  trial_flightdate_6,
  trial_flightmonth_7,
  dayofmonth,
  trial_iscancelled_9,
  trial_isdiverted_10,
  depdelayminutes
   FROM flightraw f
    INNER JOIN city c
        on (f.trial_departurecity_3=c.cityid)
    INNER JOIN AIRLINE A
        ON (F.airlineid=A.airlineid)
   where airline_nm not like '%TRIAL%' 
      and departure_airport_code <>'departure_airport_code'
   order by flightid desc,
      trial_flightdate_6  
     
       limit 20
                ''')
   
   rows = cur.fetchall(); 
   #for row in cur.execute('''
   #   select * from students
   #   '''):
   # print(row)
   #return render_template("list_status_v1.html",rows = rows)
   return render_template('flight_delete.html',rows = rows)

@app.route('/delrec',methods = ['POST', 'GET'])
def delrec():
   if request.method == 'POST':
      try:
         flight_num = request.form['flight_nm']
         flight_num = request.form['flight_num']
         oa = request.form['oa']
         Depart_dt = request.form['Depart_dt']
         
         with sql.connect("Group15.db") as con:
            cur = con.cursor()
            cur.execute("DELETE FROM flightraw WHERE flightid=trim('"+flight_num+"')")
            
            con.commit()
            msg = "Record successfully delete"
      except:
         con.rollback()
         msg = "error in delete operation"
      
      finally:
         return render_template("flight_result.html",msg = msg)
         con.close()

############################# Update flight info
@app.route('/modify_flight')
def modify_flight():
   con = sql.connect("Group15.db")
   con.row_factory = sql.Row
   
   cur = con.cursor()
   cur.execute('''select flightid,
  f.airlineid,
  trial_airlinename_2 as airline_nm,    
  trial_departurecity_3,
  airportcode as departure_airport_code, 
  arrivalcity,
  flightnum,
  trial_flightdate_6,
  trial_flightmonth_7,
  dayofmonth,
  trial_iscancelled_9,
  trial_isdiverted_10,
  depdelayminutes
   FROM flightraw f
    INNER JOIN city c
        on (f.trial_departurecity_3=c.cityid)
    INNER JOIN AIRLINE A
        ON (F.airlineid=A.airlineid)
   where airline_nm not like '%TRIAL%' 
      and departure_airport_code <>'departure_airport_code'
   order by flightid desc,
      trial_flightdate_6  
     
       limit 20
                ''')
   rows = cur.fetchall(); 
   return render_template('flight_update.html',rows = rows)

@app.route('/updrec',methods = ['POST', 'GET'])
def updrec():
     if request.method == 'POST':
      try:
         flight_num = request.form['flight_nm']
         flight_num = request.form['flight_num']
         oa = request.form['oa']
         Depart_dt = request.form['Depart_dt']
         sdt=request.form['sdt']
         adt=request.form['adt']
         
         with sql.connect("Group15.db") as con:
            cur = con.cursor()
            cur.execute("update flightraw set depdelayminutes=cast("+str(sdt)+" as double), trial_iscancelled_9=cast("+str(adt)+" as bigint) WHERE flightid=cast("+str(flight_num)+" as bigint)")
            con.commit()
            msg = "Record successfully Updated"
      except:
         con.rollback()
         msg = "error in update operation"
      
      finally:
         return render_template("flight_result.html",msg = msg)
         con.close()


if __name__ == "__main__":
    app.run()