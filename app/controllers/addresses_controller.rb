class AddressesController < AwsController
  before_filter :set_address, only: [:show]

  def index
    @addresses = @region.addresses.sort
  end

  private

  def set_address
    @address = @region.addresses.find {|needle| needle.to_param == params[:id] } || raise("Address not found with id #{params[:id]}")
  end
end
