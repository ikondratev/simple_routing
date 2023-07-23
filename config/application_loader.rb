module ApplicationLoader
  extend self

  def load!
    init_config
  end

  private

  def init_config
    require_file "config/initializers/config"
  end

  def require_file(file)
    require File.join(root, file)
  end

  def root
    File.expand_path('..', __dir__)
  end
end