class Main < Sinatra::Base

  YAML::load(File.open('config/database.yml'))[$env].each do |key, value|
    set key, value
  end

  configure $env.to_sym do
    ActiveRecord::Base.establish_connection(adapter: settings.adapter,
                                            username: settings.username,
                                            password: settings.password,
                                            host: settings.host,
                                            database: settings.database)
  end

  enable :raise_errors, :sessions, :logging
  set :session_secret, settings.session_secret
end
