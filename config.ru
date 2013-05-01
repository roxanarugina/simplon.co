require "./app"

if settings.environment == :development
  puts "foo"
  require 'rack-livereload'
  use Rack::LiveReload
end

run Sinatra::Application
