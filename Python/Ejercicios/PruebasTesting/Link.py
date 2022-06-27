from selenium import webdriver
import time

driver = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
driver.get("link que se quiere Testear")
time.quit(2)

link_recuperacion = driver.find_elemeny_by_partial_link_text("HTML text")
link_recuperacion.click()
time.quit(2)

correo = driver.find_element_by_id("HTML id")
correo.send_keys("correo")
time.sleep(2)

driver.quit()