# ABMUSUARIOS
Sistema ABM de una dietética 

Sistema de Administración de Usuarios web de una diectetica (ABM)
Este proyecto implementa un Sistema de Administración de Usuarios (ABM) utilizando Python con la biblioteca web ligera Werkzeug. El ABM permite realizar operaciones básicas de Alta, Baja y Modificación sobre una base de datos, mas concretamente en la tabla usuarios.

Características Principales:
Alta de Usuarios: Agrega nuevos usuarios al sistema proporcionando información como nombre, contraseña, correo electrónico, dirección y fecha de registro.

Baja de Usuarios: Elimina usuarios existentes del sistema mediante la identificación única asignada a cada usuario.

Modificación de Usuarios: Permite editar la información de usuarios existentes, incluyendo nombre, contraseña, correo electrónico, dirección y fecha de registro.

Tecnologías Utilizadas:
Python: Lenguaje de programación principal del proyecto.
Werkzeug: Biblioteca  web ligera utilizada para manejar las solicitudes HTTP y gestionar las rutas de la aplicación.
Jinja2: Motor de plantillas utilizado para renderizar las vistas HTML.
Instrucciones de Ejecución:
Instala las dependencias con pip install -r requirements.txt.
Ejecuta la aplicación con python app.py.
Accede a la interfaz web en http://localhost:8000/usuario.
