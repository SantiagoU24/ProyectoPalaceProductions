# funciones.py
from flask import Flask, session, request, render_template, redirect, Response
from database import mysql

app = Flask(__name__, template_folder='templates', static_folder='static')

#FUNCION LOGIN
def login(request):
    if request.method == 'POST' and 'txtCorreo' in request.form and 'txtPassword' in request.form:
        _correo = request.form['txtCorreo']
        _password = request.form['txtPassword']

        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM usuarios WHERE correo = %s AND contrasena = %s', (_correo, _password,))
        account = cur.fetchone()
        cur.close()

        if account:
            session['logueado'] = True
            session['id'] = account['id_usuario']
            session['rol'] = account['id_rol']
            return True  # Autenticación exitosa
    return False  # Autenticación fallida

#FUNCION REGISTRO USUARIOS
def crear_registro():
    if request.method == 'POST':
        nombre = request.form['txtNombre']
        apellido = request.form['txtApellido']
        tipoDocumento = request.form['txtTipoDoc']
        numeroDocumento = request.form['txtNumeroDocumento']
        correo = request.form['txtCorreo']
        celular = request.form['txtNumeroTelefono']
        fechaNacimiento = request.form['txtFechaNacimiento']
        password = request.form['txtPassword']
        
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO Usuarios (nombres, apellidos, tipo_documento, numero_documento, correo, celular, fecha_de_nacimiento , contrasena, id_rol) VALUES (%s, %s, %s, %s, %s, %s, %s, %s,'2')",
                    (nombre, apellido, tipoDocumento, numeroDocumento, correo, fechaNacimiento ,celular, password))
        mysql.connection.commit()
        cur.close()

        return 'Registro insertado correctamente'
    

    
