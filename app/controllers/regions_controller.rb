class RegionsController < ApplicationController
  before_filter :set_region, only: [:show]

  def index
    @region = Region.find("us-east-1")
    @regions = Region.all
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end
end
