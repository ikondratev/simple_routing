require 'securerandom'

module System
  class RequestId
    REQUEST_ID = "X-Request-Id"

    def initialize(app, **opts)
      @app = app
      @storage = opts[:storage] || proc { Thread.current }
      @id_generator = opts[:id_generator] || proc { SecureRandom.hex(16) }
    end

    def call(env)
      storage = @storage.respond_to?(:call) ? @storage.call : @storage
      storage[:request_id] = env["HTTP_X_REQUEST_ID"] || @id_generator.call
      status, headers, body = @app.call(env)
      headers[REQUEST_ID] ||= storage[:request_id]
      [status, headers, body]
    end
  end
end