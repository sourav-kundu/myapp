require	'rubygems'
require	'selenium-webdriver'

username=ENV['BROWSERSTACK_USERNAME']
key=ENV['BROWSERSTACK_ACCESS_KEY']
url = "http://#{username}:#{key}@hub-cloud.browserstack.com/wd/hub"

#Input Capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["os"] = "OS X"
caps["os_version"] = "Catalina"
caps["browser"] = "Safari"
caps["browser_version"] = "13.1"
caps["resolution"] = "1920x1080"
caps["build"] = ENV['BROWSERSTACK_BUILD_NAME']
caps["project"] = ENV['BROWSERSTACK_PROJECT_NAME']
caps["name"] = "myapp test 3"
caps["browserstack.local"] = "true"
caps["browserstack.localIdentifier"] = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
caps["browserstack.debug"] = "true"
caps["browserstack.networkLogs"] = "true"
caps["browserstack.timezone"] = "New York"
caps["browserstack.selenium_version"] = "4.0.0-alpha-2"


driver = Selenium::WebDriver.for(:remote,
	:url => url,
	:desired_capabilities => caps)

driver.navigate.to "http://localhost:3000"
puts driver.title
driver.close()
driver.quit()
