from selenium import webdriver
import time

controlador = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
controlador.get("Pagina que se quiere Testear")
time.sleep(1)
usuario = controlador.find_element_by_name("email")
clave = controlador.find_element_by_name("password")
time.sleep(1)
usuario.send_keys("Correo")
time.sleep(2)
clave.send_keys("Contraseña")
time.sleep(2)
boton = controlador.find_element_by_name("submit")
boton.click()
time.sleep(3)
