class Router
  def initialize(request)
    @request = request
  end

  def route!
    controller = controller_class.new(@request)

    if controller.respond_to?(route_info[:action])
      controller.send(route_info[:action])
    else
      controller.not_found
    end
  end

  private

  def route_info
    @route_info ||= extract_route_info
  end

  def extract_route_info
    {
      resource: path_fragments.empty? ? "base" : path_fragments[0],
      action: find_action(path_fragments[1])
    }
  end

  def find_action(fragment)
    case fragment
    when nil
      @request.get? ? :ping : :pong
    else
      nil
    end
  end


  def path_fragments
    @request.path.split("/").reject { |s| s.empty? }
  end

  def controller_class
    controller_name = route_info[:resource].capitalize
    Object.const_get("Controllers::#{controller_name}Controller")
  rescue NameError
    Controllers::BaseController
  end
end