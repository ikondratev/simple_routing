require_relative './base_controller.rb'

module Controllers
  class PingController < BaseController

    # @!method [GET]
    def ping
      build_response(body: ["PONG"])
    end

    # @!method [POST]
    def pong
      build_response(body: ["PING"])
    end
  end
end