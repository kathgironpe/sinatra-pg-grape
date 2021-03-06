class Main < Sinatra::Base

  YAML.load(ERB.new(File.read('./config/database.yml')).result)[$env].each do |key, value|
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
  set :default_pagination_count, settings.default_pagination_count
end
