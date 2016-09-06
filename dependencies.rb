ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'

%w(
  active_record
  active_support
  grape
  pg
  sinatra
  will_paginate
  will_paginate/active_record
).each { |dep| require dep }

$env = ENV['RACK_ENV']
