require 'rubygems'
require 'appium_lib'

require './final'
 
class Trial
	def run(url,username,access_key)
		

		caps = {}
		caps['build'] = 'Ruby Appium Sample'
		caps['name'] = 'Chirag Test'
		caps['device'] = 'Google Nexus 6'
		caps['os_version'] = '6.0'
		caps['browserstack.debug'] = true
		caps['app'] = url
		 
		appium_driver = Appium::Driver.new({
		    'caps' => caps,
		    'appium_lib' => {
		        :server_url => "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
		    }}, true)
		driver = appium_driver.start_driver
		 
		wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		wait.until { driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
		element = driver.find_element(:accessibility_id, "Search Wikipedia")
		element.click
		 
		driver.quit

	end

	def start
		require 'rubygems'
		require 'selenium-webdriver'

		driver = Selenium::WebDriver.for :chrome
		wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		driver.manage.timeouts.implicit_wait = 60

		link = "https://www.browserstack.com/app-automate"
		sign_in = "Sign in"
		uname = "user_email_login"
		password = "user_password"
		email = "*******@gmail.com"
		pwd = "******"
		submit = "user_submit"
		completed = "status-text"


		driver.get link
		driver.find_element(:link_text, sign_in).click

		element = driver.find_element(:id, uname) 

		wait.until{ element.displayed? && element.enabled?}


		element.send_keys(email) 

		element = driver.find_element(:id, password) 

		wait.until{ element.displayed? && element.enabled?}

		element.send_keys(pwd) 

		element = driver.find_element(:id, submit).click

		element = driver.find_element(:css, "a[title='Chirag Test']")

		wait.until{ element.displayed? && element.enabled?}

		element.click
		element = driver.find_element(:class, completed)
		wait.until{ element.displayed? && element.enabled?}
		txt = element.text
		# puts "Completed"
		driver.quit

		return txt
	end

end