from database import db


class Persona(db.Model):
    id =db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(250))
    apellido = db.Column(db.String(250))
    email = db.Column(db.String(250))
    
    def __str__(self):
        return (
            f'Id:{self.id}',
            f'nombre:{self.nombre}',
            f'apellido:{self.apellido}',
            f'email:{self.email}'
        )
