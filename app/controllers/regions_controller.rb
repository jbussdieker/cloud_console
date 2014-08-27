class RegionsController < ApplicationController
  before_filter :set_region, only: [:show]

  def index
    @regions = Region.all
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end
end
