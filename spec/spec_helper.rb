ENV['RACK_ENV'] ||= 'test'

[
  'capybara/dsl',
  'rack/test',
  'rspec',
  './main'
].each do |d|
  require d
end

Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include Rack::Test::Methods
end
