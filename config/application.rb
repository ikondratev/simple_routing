class Application
  def call(env)
    ::Router.new(Rack::Request.new(env)).route!
  end
end