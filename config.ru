require './config/environment'
require 'config'

use Rack::Ougai::LogRequests, ::System::AppLogger.new.instance
use System::RequestId
run Application.new