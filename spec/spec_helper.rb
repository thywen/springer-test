require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'
require 'factory_girl'
require 'faker'
require 'selenium-webdriver'
require 'require_all'
require_rel '../lib/page_objects'


Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app)
end

Capybara.run_server = false
Capybara.javascript_driver = :firefox
Capybara.current_driver = :firefox
Capybara.app_host = 'https://rd.springer.com'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
