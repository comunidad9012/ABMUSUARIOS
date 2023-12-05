import database as db
from ruteador import render_template, request, wsgi
from werkzeug.utils import redirect
from werkzeug.wrappers import Response

app = wsgi()




@app.route([ "/","/usuario"])
def home():
        cursor = db.database.cursor()
        cursor.execute("SELECT * FROM usuario")
        result = cursor.fetchall()
        column_names = [column[0] for column in cursor.description]
        insert_object = [dict(zip(column_names, record)) for record in result]
        cursor.close()
        
        response = Response(response=render_template("index.html", data=insert_object), content_type="text/html")
        return response

@app.route("/usuario/add_user")
def add_user():
    if request.method == "POST":
        Nombre = request.form['Nombre']
        Contraseña = request.form['Contraseña']
        Correo_elec = request.form['Correo_elec']
        Direccion = request.form['Direccion']
        Fecha_regis = request.form['Fecha_regis']

        if Nombre and Contraseña and Correo_elec and Direccion and Fecha_regis:
            cursor = db.database.cursor()
            sql = "INSERT INTO usuario (Nombre, Contraseña, Correo_elec, Direccion, Fecha_regis) VALUES (%s, %s, %s, %s, %s)"
            data = (Nombre, Contraseña, Correo_elec, Direccion, Fecha_regis)
            cursor.execute(sql, data)
            db.database.commit()

    return redirect("/usuario")

@app.route("/usuario/delete_user/<int:user_id>")
def delete_user(user_id):
    try:
        cursor = db.database.cursor()
        sql = "DELETE FROM usuario WHERE user_id=%s"
        data = (user_id,)
        cursor.execute(sql, data)
        db.database.commit()
        return redirect("/usuario")
    except Exception as e:
        return Response(f"Error in delete_user function: {str(e)}", content_type="text/plain", status=500)

@app.route("/usuario/edit_user/<int:user_id>")
def edit_user(user_id):
    try:
        if request.method == "POST":
            Nombre = request.form['Nombre']
            Contraseña = request.form['Contraseña']
            Correo_elec = request.form['Correo_elec']
            Direccion = request.form['Direccion']
            Fecha_regis = request.form['Fecha_regis']

            if Nombre and Contraseña and Correo_elec and Direccion and Fecha_regis:
                cursor = db.database.cursor()
                sql = "UPDATE usuario SET Nombre= %s, Contraseña=%s, Correo_elec=%s, Direccion=%s, Fecha_regis=%s WHERE user_id=%s"
                data = (Nombre, Contraseña, Correo_elec, Direccion, Fecha_regis, user_id,)
                cursor.execute(sql, data)
                db.database.commit()
        return redirect("/usuario")
    except Exception as e:
        return Response(f"Error in edit_user function: {str(e)}", content_type="text/plain", status=500)


if __name__ == "__main__":
    app.run()