ENV['RACK_ENV'] ||= 'test'

%w(
  capybara/dsl
  factory_girl
  ffaker
  rack/test
  rspec
  ./main
).each { |d|  require d }

Dir[('./spec/support/**/*.rb')].each { |f| require f }

FactoryGirl.definition_file_paths = %w(spec/factories)
FactoryGirl.find_definitions

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include FactoryGirl::Syntax::Methods
  c.include Rack::Test::Methods
end
