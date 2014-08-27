class AddressesController < ApplicationController
  before_filter :set_region
  before_filter :set_address, only: [:show]

  def index
    @addresses = @region.addresses
  end

  private

  def set_address
    @address = @region.addresses.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
