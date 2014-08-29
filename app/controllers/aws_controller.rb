class AwsController < ApplicationController
  before_action :authenticate_user!

  before_filter :set_account
  before_filter :set_regions
  before_filter :set_region
  layout 'aws'

  private

  def set_account
    @account = current_user.accounts.first
  end

  def set_regions
    @regions = @account.regions
  end

  def set_region
    if params[:controller].to_sym == :regions && params[:action].to_sym == :index
      @region = @regions.first
    elsif params[:controller].to_sym == :regions
      @region = @regions.find(params[:id])
    elsif params.has_key? :region_id
      @region = @regions.find(params[:region_id])
    else
      raise "Can't find region #{params}"
    end
  end
end
