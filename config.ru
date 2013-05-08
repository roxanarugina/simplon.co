require "./app"

if settings.environment == :development
  require 'rack-livereload'
  require 'pry'
  use Rack::LiveReload
end

require 'rack/thumb'
use Rack::Thumb
use Rack::Static, :urls => ["/media"]

run Sinatra::Application
