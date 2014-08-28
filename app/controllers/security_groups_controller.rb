class SecurityGroupsController < AwsController
  before_filter :set_security_group, only: [:show]

  def index
    @security_groups = @region.security_groups.sort
  end

  private

  def set_security_group
    @security_group = @region.security_groups.find {|needle| needle.to_param == params[:id] }
  end
end
