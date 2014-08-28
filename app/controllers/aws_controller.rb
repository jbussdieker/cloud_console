class AwsController < ApplicationController
  before_filter :set_regions

  private

  def set_regions
    @regions = Region.all
  end
end
