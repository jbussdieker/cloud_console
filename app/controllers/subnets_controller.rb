class SubnetsController < ApplicationController
  before_filter :set_region
  before_filter :set_subnet, only: [:show]

  def index
    @subnets = @region.subnets
  end

  private

  def set_subnet
    @subnet = @region.subnets.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
