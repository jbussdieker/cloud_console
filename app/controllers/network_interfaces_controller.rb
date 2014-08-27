class NetworkInterfacesController < ApplicationController
  before_filter :set_region
  before_filter :set_network_interface, only: [:show]

  def index
    @network_interfaces = @region.network_interfaces
  end

  private

  def set_network_interface
    @network_interface = @region.network_interfaces.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
