from flask import Flask, redirect, render_template, request, url_for
from flask_migrate import Migrate

from models import Persona
from database import db
from forms import PersonaForm

app = Flask(__name__)

# Configuracion de la BD
USER_DB = 'postgres'
PASS_DB = 'admin'
URL_DB = 'localhost'
NAME_DB = 'sap_flask_db'
PORT_DB = 5432
FULL_URL_DB = f'postgresql://{USER_DB}:{PASS_DB}@{URL_DB}:{PORT_DB}/{NAME_DB}'

app.config['SQLALCHEMY_DATABASE_URI'] = FULL_URL_DB
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#  Inicializacion del objeto db de SQLalchemy
db.init_app(app)


# Configurar flask-migrate
migrate = Migrate()
migrate.init_app(app, db)
'''
flask db init
flask db migrate
flask db upgrade
flask db stamp head
'''
app.config['SECRET_KEY']='llave_secreta'
        
@app.route('/')
@app.route('/index')
@app.route('/index.html')
def inicio():
    # Listado personas
    personas = Persona.query.order_by('id')
    total_personas = Persona.query.count()
    app.logger.debug(f'Listado Personas: {personas}')
    app.logger.debug(f'Total Personas: {total_personas}')
    return render_template('index.html', personas=personas, total_personas=total_personas)

@app.route('/ver/<int:id>')
def ver_detalle(id):
    # Recuperamos la persona segun el id proporcionado
    persona = Persona.query.get_or_404(id) 
    return render_template('detalle.html', persona=persona)

@app.route('/agregar', methods=['GET','POST'])
def agregar():
    # python -m pip install flask wtf
    persona = Persona()
    personaForm = PersonaForm(obj=persona)
    if request.method == 'POST':
        if personaForm.validate_on_submit():
           personaForm.populate_obj(persona)
           # app.logger.debug(f'Persona a insertar: {persona}')
           # Insertamos el nuevo registro
           db.session.add(persona)
           db.session.commit()
           return redirect(url_for('inicio'))
    return render_template('agregar.html', forma=personaForm)

@app.route('/editar/<int:id>',methods=['GET', 'POST'])
def editar(id):
    persona = Persona.query.get_or_404(id)
    personaForm = PersonaForm(obj=persona)
    if request.method == 'POST':
        if personaForm.validate_on_submit():
           personaForm.populate_obj(persona)
           # app.logger.debug(f'Persona a actualizar: {persona}')
           db.session.commit()
           return redirect(url_for('inicio'))
    return render_template('editar.html', forma=personaForm)

@app.route('/eliminar/<int:id>')
def eliminar(id):
    persona = Persona.query.get_or_404(id)
    # app.logger.debug(f'Persona a eliminar: {persona}')
    db.session.delete(persona)
    db.session.commit()
    return redirect(url_for('inicio'))

'''
    .venv\Scripts\activate
    $env:FLASK_APP = "app.py"
	$env:FLASK_ENV = "development"
'''