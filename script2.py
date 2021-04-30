# -*- coding: utf8 -*-
import psycopg2
import csv
conn = psycopg2.connect("host=localhost dbname=zno_db user=postgres password = Aleksandra2 port=5432")
cursor = conn.cursor()
query1 = '''
        SELECT 
        gl.regname,
        Max(ze.BALL100),
        ze.Years
        FROM EXAM ze
        LEFT JOIN EducationalEstablishment es
            ON ze.eduestId = es.eduestId
        LEFT JOIN GEOLOCATION gl
            ON es.locationId = gl.locationId
            
          WHERE ze.disciplineName = 'Українська мова і література' AND
                ze.TestStatus = 'Зараховано'   
        GROUP BY
        gl.regname, ze.Years;
'''
cursor.execute(query1)
print("Selecting rows from mobile table using cursor.fetchall")
zno_results = cursor.fetchall()
print("Print each row and it's columns values")
with open('zno_results2.csv', 'w', encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(['Region', 'Max2019', 'Max2020'])
cursor.close()
conn.close()
