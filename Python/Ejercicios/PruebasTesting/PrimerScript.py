from selenium import webdriver
driver = webdriver.firefox(executable_path="Drivers/geckodriver.exe")
driver.maximize_wwindows()
driver.get("link_para_testear")
driver.close()