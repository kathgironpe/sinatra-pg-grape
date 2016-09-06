require './dependencies'
require './main'

if $env == 'development'
require 'ffaker'

  namespace :db do
    desc 'Load test data'
    task :populate_db do
      500.times do
        p = Post.new
        p.title = FFaker::HipsterIpsum.sentence
        p.body = FFaker::LoremFR.paragraphs.join(' ')
        p.save!
      end
    end
  end
end
