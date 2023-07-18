module Controllers
  class BaseController
    attr_reader :request, :routes

    def initialize(request)
      @request = request
    end

    def build_response(status: 200, body:[])
      [status, { "Content-Type" => "text/html" }, body]
    end

    def not_found(status: 404)
      [status, { "Content-Type" => "text/html" }, ["Not found"]]
    end

    def params
      @request.params
    end
  end
end