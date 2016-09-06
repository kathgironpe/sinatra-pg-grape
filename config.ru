require './main'
run Rack::Cascade.new [Post, Main]
