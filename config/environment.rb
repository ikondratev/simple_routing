ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

app_files = File.expand_path('../../app/**/*.rb', __FILE__)
Dir.glob(app_files).each { |file| require(file) }

require './config/application.rb'
require './app/lib/system/request_id'
require './app/lib/system/app_logger'

require_relative 'application_loader'
ApplicationLoader.load!
