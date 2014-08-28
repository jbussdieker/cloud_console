class VpcsController < AwsController
  before_filter :set_region
  before_filter :set_vpc, only: [:show]

  def index
    @vpcs = @region.vpcs.sort
  end

  private

  def set_vpc
    @vpc = @region.vpcs.find { |needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
