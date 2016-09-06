ENV['RACK_ENV'] ||= 'test'

['rack/test',
 'rspec',
 './main'
].each do |d|
  require d
end

Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.mock_with :rspec
  c.include Rack::Test::Methods
end
