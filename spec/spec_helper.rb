ENV['RACK_ENV'] ||= 'test'

%w(
  capybara/dsl
  rack/test
  rspec
  ./main
).each { |d|  require d }

Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include Rack::Test::Methods
end
