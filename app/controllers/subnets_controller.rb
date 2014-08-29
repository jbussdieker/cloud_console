class SubnetsController < AwsController
  before_filter :set_subnet, only: [:show]

  def index
    @subnets = @region.subnets
  end

  private

  def set_subnet
    @subnet = @region.subnets.find(params[:id])
  end
end
