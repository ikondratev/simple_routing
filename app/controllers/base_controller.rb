module Controllers
  class BaseController
    attr_reader :request

    def initialize(request)
      @request = request
    end

    private

    def build_response(status: 200, body:[])
      [status, { "Content-Type" => "text/html" }, body]
    end

    def params
      @request.params
    end
  end
end