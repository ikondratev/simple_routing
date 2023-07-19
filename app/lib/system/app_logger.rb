require 'rack/ougai'

module System
  class AppLogger
    attr_reader :instance
    PRODUCTION_MODE = "production".freeze

    def initialize(mode: "development")
      @mode = mode
      @instance = PRODUCTION_MODE.include?(mode) ? prod_mode : debug_mode
    end

    private

    def prod_mode
      root_path = File.expand_path("../..", __dir__)

      logger = Ougai::Logger.new(
        root_path.concat("/", Settings.log.path),
        level: Settings.log.level
      )

      setup_logger_output(logger)
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