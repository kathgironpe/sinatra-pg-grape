ENV['RACK_ENV'] ||= 'test'

%w(
  capybara/dsl
  rack/test
  rspec
  ./main
  shoulda/matchers
).each { |d|  require d }

Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include Rack::Test::Methods
  c.include(Shoulda::Matchers::ActiveRecord, type: :model)
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end
