import turtle
import time
import random

s = turtle.Screen()
s.setup(650,650)
s.bgcolor("gray")
s.title(" Juego de la Serpiente")

retraso = 0.1
vel = 5
marcador = 0
marcador_max = 0

Snake = turtle.Turtle()
Snake.speed(vel)
Snake.shape("square")
Snake.color("black","green")
Snake.penup()
Snake.goto(0,0)
Snake.direction = "stop"

Food = turtle.Turtle()
Food.shape("circle")
Food.color("orange")
Food.penup()
Food.goto(0,100)
Food.speed(0)

Cuerpo = []
texto = turtle.Turtle()
texto.speed(0)
texto.color("black")
texto.penup()
texto.hideturtle()
texto.goto(0, 260)
texto.write("Marcador: 0\tMarcador mas alto: 0", align="center", font= ("verdana", 20, "normal"))

def arriba():
    Snake.direction = "up"
def abajo():
    Snake.direction = "down"
def izquierda():
    Snake.direction = "left"
def derecha():
    Snake.direction = "right"

def movimiento():
    if Snake.direction == "up":
        y = Snake.ycor()
        Snake.sety(y+20)
    if Snake.direction == "down":
        y = Snake.ycor()
        Snake.sety(y-20)
    if Snake.direction == "left":
        x = Snake.xcor()
        Snake.setx(x-20)
    if Snake.direction == "right":
        x = Snake.xcor()
        Snake.setx(x+20)

s.listen()
s.onkeypress(arriba, "Up")
s.onkeypress(abajo, "Down")
s.onkeypress(izquierda, "Left")
s.onkeypress(derecha, "Right")

while True:
    s.update()

    if Snake.xcor()> 300 or Snake.xcor() < -300 or Snake.ycor() > 250 or Snake.ycor() < -300:
        time.sleep(2)
        for i in Cuerpo:
            i.clear()
            i.hideturtle()
        Snake.home()
        Snake.direction = "stop"
        Cuerpo.clear()

        marcador = 0
        texto.clear()
        texto.write("Marcador: {}\tMarcador mas alto: {}".format(marcador, marcador_max), align="center", font= ("verdana", 20, "normal"))

    if Snake.distance(Food) < 20:
        x = random.randint(-250, 250)
        y = random.randint(-250, 250)
        Food.goto(x,y)

        nuevo_cuerpo = turtle.Turtle()
        nuevo_cuerpo.shape("square")
        nuevo_cuerpo.color("green")
        nuevo_cuerpo.penup()
        nuevo_cuerpo.goto(0,0)
        nuevo_cuerpo.speed(0)
        Cuerpo.append(nuevo_cuerpo)

        marcador += 10
        if marcador > marcador_max:
            marcador_max = marcador
            texto.clear()
            texto.write("Marcador: {}\tMarcador mas alto: {}".format(marcador, marcador_max), align="center", font= ("verdana", 20, "normal"))
    
    total = len(Cuerpo)
    for index in range(total -1 , 0, -1):
        x = Cuerpo[index-1].xcor()
        y = Cuerpo[index-1].ycor()
        Cuerpo[index].goto(x,y)
        # Snake.speed(vel+1)

    if total > 0:
        x = Snake.xcor()
        y = Snake.ycor()
        Cuerpo[0].goto(x,y)

    movimiento()

    for i in Cuerpo:
        if i.distance(Snake) < 20:
            for i in Cuerpo:
                i.clear()
                i.hideturtle()
            Snake.home()
            Cuerpo.clear()
            Snake.direction = "stop"

    time.sleep(retraso)

turtle.done()