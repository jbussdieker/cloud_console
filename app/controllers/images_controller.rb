class ImagesController < ApplicationController
  before_filter :set_region
  before_filter :set_image, only: [:show]

  def index
    @images = @region.images
  end

  private

  def set_image
    @image = @region.images.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
