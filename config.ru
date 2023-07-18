require './config/environment'

use Rack::Ougai::LogRequests, System::AppLogger.new.instance
use Middleware::RequestId
run Application.new