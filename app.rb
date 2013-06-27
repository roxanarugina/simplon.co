require 'sinatra'
require 'haml'
require 'rdiscount'
require 'compass'
require 'zurb-foundation'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname __FILE__
    config.sass_dir = File.join "views", "scss"
    config.images_dir = File.join "views", "images"
    config.http_path = "/"
    config.http_images_path = "/images"
    config.http_stylesheets_path = "/stylesheets"
  end

  set :scss, Compass.sass_engine_options
  set :markdown, :layout_engine => :haml
end

get '/' do
  haml :home
end

get '/en' do
  haml :home_en
end

get "/stylesheets/*.css" do |path|
  content_type "text/css", charset: "utf-8"
  scss :"scss/#{path}"
end

get %r{/(landing/)?(?<page>.*)} do
  page = params[:page]
  if File.exists?("./views/#{page}.md")
    "<div class='row'><div class='large-12 columns'>#{markdown page.to_sym}</div></div>"
  else
    haml page.to_sym
  end
end

helpers do
  def body_class
    request.path.gsub('/',' ').strip
  end
end
