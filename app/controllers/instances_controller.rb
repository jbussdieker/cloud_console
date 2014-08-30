class InstancesController < AwsController
  before_filter :set_instance, only: [:show]

  def index
    @instances = @region.instances.sort
  end

  private

  def set_instance
    @instance = @region.instances.find(params[:id])
  end
end
