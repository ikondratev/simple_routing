require 'rack/ougai'

module System
  class AppLogger
    attr_reader :instance

    def initialize(mode: "development")
      @mode = mode
      @instance = debug_mode
    end

    def debug_mode
      logger = Ougai::Logger.new($stdout)
      setup_logger_output(logger)
    end

    def setup_logger_output(logger)
      logger.before_log = lambda do |data|
        data[:app_mode] = @mode
        data[:request_id] ||= Thread.current[:request_id]
      end

      logger
    end
  end
end