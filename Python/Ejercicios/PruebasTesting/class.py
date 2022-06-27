from selenium import webdriver
import time

driver = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
driver.get("Pagina que se quiere Testear")
time.sleep(1)
email = driver.find_element_by_class_name("HTML Class")
clave = driver.find_element_by_class_name("HTML Class")
time.sleep(1)
email.send_keys("Correo")
time.sleep(2)
clave.send_keys("contraseña")
time.sleep(2)
boton = driver.find_element_by_class_name("HTML Class")
boton.click()

driver.close()
