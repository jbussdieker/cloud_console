class AwsController < ApplicationController
  before_filter :set_regions
  before_filter :set_region
  layout 'aws'

  private

  def set_region
    if params[:controller].to_sym == :regions && params[:action].to_sym == :index
      @region = Region.all.first
    elsif params[:controller].to_sym == :regions
      @region = Region.find(params[:id])
    elsif params.has_key? :region_id
      @region = Region.find(params[:region_id])
    else
      raise "Can't find region #{params}"
    end
  end

  def set_regions
    @regions = Region.all.sort
  end
end
