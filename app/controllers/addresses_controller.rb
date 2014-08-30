class AddressesController < AwsController
  before_filter :set_address, only: [:show]

  def index
    @addresses = @region.addresses.sort
  end

  private

  def set_address
    @address = @region.addresses.find(params[:id])
  end
end
