require "./app"

if settings.environment == :development
  require 'rack-livereload'
  use Rack::LiveReload
end

run Sinatra::Application
