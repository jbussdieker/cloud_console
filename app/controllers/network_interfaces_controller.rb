class NetworkInterfacesController < AwsController
  before_filter :set_network_interface, only: [:show]

  def index
    @network_interfaces = @region.network_interfaces.sort
  end

  private

  def set_network_interface
    @network_interface = @region.network_interfaces.find {|needle| needle.to_param == params[:id] }
  end
end
