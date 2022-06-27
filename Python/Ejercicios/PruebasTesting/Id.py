from selenium import webdriver
import time

controlador = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
controlador.get("link que se quiere testear")
usuario = controlador.find_element_by_id("HTML id")
clave = controlador.find_element_by_id("HTML id")
time.sleep(1)
boton = controlador.find_element_by_id("HTML id")

usuario.send_keys("Correo")
time.sleep(2)
clave.send_keys("Contraseña_de_la_cuenta")
time.sleep(2)
boton.click()

controlador.quit()
