require './config/environment'

use Rack::Ougai::LogRequests, ::System::AppLogger.new.instance
use System::RequestId
run Application.new