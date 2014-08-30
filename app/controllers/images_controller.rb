class ImagesController < AwsController
  before_filter :set_image, only: [:show]

  def index
    @images = @region.images.sort
  end

  private

  def set_image
    @image = @region.images.find(params[:id])
  end
end
