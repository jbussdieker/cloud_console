class InstancesController < AwsController
  before_filter :set_region
  before_filter :set_instance, only: [:show]

  def index
    @instances = @region.instances
  end

  private

  def set_instance
    @instance = @region.instances.find {|needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
