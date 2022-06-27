import turtle
import random
import time

s = turtle.Screen()
s.title("Juego de la Tortuga")
s.bgcolor("gray")

ply1 = turtle.Turtle()
ply2 = turtle.Turtle()

ply1.hideturtle()
ply1.shape("turtle")
ply1.color("red", "red")
ply1.shapesize(3,3,3)
ply1.pensize(3)
ply1.penup()

ply2.hideturtle()
ply2.shape("turtle")
ply2.color("blue", "blue")
ply2.shapesize(3,3,3)
ply2.pensize(3)
ply2.penup()

ply1.goto(200,75)
ply1.pendown()
ply1.circle(50)
ply2.goto(200,-175)
ply2.pendown()
ply2.circle(50)

ply1.penup()
ply1.goto(-200, 125)
ply1.showturtle()
ply2.penup()
ply2.goto(-200, -125)
ply2.showturtle()

for i in range(20):
    if ply1.pos() >= (180, 125):
        print("La tortuga roja ha ganado")
        break
    elif ply2.pos() >= (180, -125) :
        print("La tortuga azul ha ganado")
        break
    else:
        ply1.pendown()
        ply1.fd((random.randint(1,6)*10))
        time.sleep(0.5)
        ply2.pendown()
        ply2.fd((random.randint(1,6)*10))
        time.sleep(0.5)
    
turtle.done()