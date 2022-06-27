from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
driver.get("link paquina que se quiere Testear")
driver.maximize_window()
time.sleep(2)
correo = driver.find_element(By.ID, "HTML id")
clave = driver.find_element(By.ID, "Contraseña")
time.sleep(2)
correo.send_keys("Correo")
clave.send_keys("Contraseña")
time.sleep(2)
boton = driver.find_element(By.ID, "HTML id")
boton.click()
time.sleep(2)

driver.quit()