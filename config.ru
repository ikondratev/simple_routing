require 'rubygems'
require 'bundler/setup'
require './application'
require './middleware/request_id'
require './system/app_logger'

use Rack::Ougai::LogRequests, System::AppLogger.new.instance
use Middleware::RequestId
run Application.new