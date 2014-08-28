class SubnetsController < AwsController
  before_filter :set_subnet, only: [:show]

  def index
    @subnets = @region.subnets.sort
  end

  private

  def set_subnet
    @subnet = @region.subnets.find {|needle| needle.to_param == params[:id] }
  end
end
