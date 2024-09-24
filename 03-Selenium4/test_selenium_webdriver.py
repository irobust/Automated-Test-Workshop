import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver import Keys


class PythonOrgSearch(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_search_in_python_org(self):
        driver = self.driver
        driver.get("http://codinggun.com")

        btn = driver.find_element(By.XPATH, "/html/body/header/ul/li[4]/span")
        btn.click()

        txtSearch = driver.find_element(By.CSS_SELECTOR, ".px-3")
        txtSearch.send_keys("selenium")
        txtSearch.send_keys(Keys.RETURN)

        driver.implicitly_wait(2)
        result = driver.find_element(By.CSS_SELECTOR, '.search-list > li:nth-child(1) div')
        result.click()
        self.assertIn("Selenium", driver.title)

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()
