class SecurityGroupsController < ApplicationController
  before_filter :set_region
  before_filter :set_security_group, only: [:show]

  def index
    @security_groups = @region.security_groups
  end

  private

  def set_security_group
    @security_group = @region.security_groups.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
