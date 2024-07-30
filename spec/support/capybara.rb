# frozen_string_literal: true

# I had trouble using `app` as the hostname, so I grabbed the IP address
Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
Capybara.asset_host = Capybara.app_host

# Set the host and port
Capybara.server_host = '0.0.0.0'
Capybara.server_port = '3000'

Capybara.default_max_wait_time = 5
Capybara.configure do |config|
  config.match = :prefer_exact
end

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--enable-features=NetworkService,NetworkServiceInProcess')
  options.add_argument('--headless')
  # options.add_argument('--disable-gpu')
  # options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1680,1050')
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: "http://#{ENV.fetch('CHROME_DRIVER_HOST')}:4444/wd/hub",
    options:
  )
end

Capybara.javascript_driver = :selenium
Capybara.server = :puma, { Silent: true }

# This will force capybara to inclue the port in requests
Capybara.always_include_port = true

Capybara::Screenshot.register_driver(:selenium) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara::Screenshot.prune_strategy = { keep: 30 }
