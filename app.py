# app.py
from flask import Flask, render_template, request, session
from database import inicializar_mysql, mysql
from funciones import *

app = Flask(__name__)
with app.app_context():
    inicializar_mysql(app)

#HOME
@app.route('/')
def home():
    return render_template('home.html')

#LOGIN - INICIO DE SESION
@app.route('/login', methods=["GET", "POST"])
def login_route():
    if request.method == 'POST': #le digo que viene de un dato requerido por POST
        if login(request) and session['rol'] == 1: 
            return render_template("admin.html") #INGRESO AL SISTEMA POR ID COMO ADMIN
        
        elif session['rol'] == 2:
            return render_template('cliente.html')#INGRESO AL SISTEMA POR ID COMO CLIENTE
        else:
            return render_template('login.html') #DATOS INCORRECTOS, REDIRECCIONA LOGIN NUEVAMENTE
    else:
        return render_template('login.html') #SI TODA LA CONSULTA FALLA RENDERIZA LOGIN NUEVAMENTE

#REGISTRO DE USUARIOS
@app.route('/registro', methods=['GET', 'POST'])
def registrar_usuario():
    if request.method == 'POST':
        resultado = crear_registro()  # Llama a la función de funciones.py
        # Puedes hacer algo con el resultado, por ejemplo, mostrarlo en la respuesta HTTP
        return resultado

    # Si es una solicitud GET, simplemente renderiza el formulario
    return render_template('registro.html')


#PORTAFOLIO 
@app.route('/portafolio')
def portafolio():
    return render_template('briefcase.html')




if __name__ == '__main__':
    app.secret_key = "santiago_urrea"
    app.run(debug=True, port=4000)
