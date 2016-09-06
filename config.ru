require './main'
run Rack::Cascade.new [Posts, Main]
