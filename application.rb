app_files = File.expand_path('../app/**/*.rb', __FILE__)
Dir.glob(app_files).each { |file| require(file) }

class Application
  def call(env)
    Router.new(Rack::Request.new(env)).route!
  end
end