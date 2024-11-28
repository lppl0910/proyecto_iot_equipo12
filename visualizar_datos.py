import flet as ft
import datetime
import mysql.connector as MySQL
import pandas as pd
import matplotlib.pyplot as plot
from flet.matplotlib_chart import MatplotlibChart

def main(page:ft.Page):

	page.window_maximized=True
	page.title='ScanAir'
	page.vertical_alignment = ft.MainAxisAlignment.CENTER
	page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

	t = ft.Text(value="Bienvenido a ScanAir",
        color="white",
        size=20,
        weight=ft.FontWeight.BOLD
    )

	def date_change_inicial(e):
		date_button_inicial.text = datepicker_inicial.value.strftime("%Y-%m-%d")
		page.update()

	def date_change_final(e):
		date_button_final.text = datepicker_final.value.strftime("%Y-%m-%d")
		page.update()

	fig, (ax1,ax2,ax3) = plot.subplots(3)	

	def click_consult(e):
		if conexion.is_connected():

			ax1.clear()
			ax2.clear()
			ax3.clear()

			cursor = conexion.cursor()
			cursor.execute("SELECT MAX(grados), MIN(grados), AVG(grados) FROM temperatura WHERE timestamp BETWEEN \"{}\" AND \"{}\"".format(datepicker_inicial.value.strftime("%Y-%m-%d"),datepicker_final.value.strftime("%Y-%m-%d")))
			renglones = cursor.fetchall()

			valores = [renglon[0] for renglon in renglones]

			tabla = pd.DataFrame(renglones, columns=["Máximo", "Mínimo", "Promedio"])

			ax1.axis('tight')
			ax1.axis('off')
			ax1.table(cellText=tabla.values, colLabels=tabla.columns, loc='center', cellLoc = 'center')
			ax1.set_title("Valores relevantes de temperatura en noviembre")

			cursor = conexion.cursor()
			cursor.execute("SELECT AVG(co.ppm) AS CO, AVG(co2.ppm) AS CO2, AVG(alcohol.ppm) AS Alcohol FROM co, co2, alcohol, dispositivo WHERE (co.ppm < 10) AND (co2.ppm < 10) AND (alcohol.ppm < 10) AND (dispositivo.ubicacion = \"CEM\")")
			renglones = cursor.fetchall()

			mediciones = ["CO", "CO2", "Alcohol"]
			promedios = renglones[0]

			ax2.bar(mediciones, promedios, color='red')
			ax2.set_xlabel("Mediciones")
			ax2.set_ylabel("Promedio")
			ax2.set_title("Promedios de calidad del aire en CEM")

			cursor = conexion.cursor()
			cursor.execute("SELECT id, ppm FROM co2 WHERE timestamp BETWEEN \"{}\" AND \"{}\"".format(datepicker_inicial.value.strftime("%Y-%m-%d"),datepicker_final.value.strftime("%Y-%m-%d")))
			renglones = cursor.fetchall()

			id = [renglon[0] for renglon in renglones]
			ppm = [renglon[1] for renglon in renglones]

			ax3.bar(id, ppm, color='red')
			ax3.set_xlabel("Numero de lectura")
			ax3.set_ylabel("ppm")

		else:
			print("No se pudo conectar a la base de datos")

		page.update()

	datepicker_inicial = ft.DatePicker(value=datetime.date.today(),first_date = datetime.date(year=2024, month=10,day=1),
							last_date=datetime.date.today(),
							on_change=date_change_inicial)
	
	datepicker_final = ft.DatePicker(value=datetime.date.today(),first_date = datetime.date(year=2024, month=10,day=1),
							last_date=datetime.date.today(),
							on_change=date_change_final)
	
	date_button_inicial = ft.ElevatedButton("Seleccciona la fecha inicial",
					icon=ft.icons.CALENDAR_MONTH,
					on_click=lambda e: page.open(datepicker_inicial))
	
	date_button_final = ft.ElevatedButton("Seleccciona la fecha final",
					icon=ft.icons.CALENDAR_MONTH,
					on_click=lambda e: page.open(datepicker_final))

	consult = ft.ElevatedButton(text = "Consultar",on_click=click_consult)

	#Conexion a SQL

	conexion = MySQL.connect(host="localhost", user="root", password="", database="scanair")

	page.add(t,date_button_inicial,date_button_final,consult)
	page.add(MatplotlibChart(fig,expand=True))


ft.app(target=main)
