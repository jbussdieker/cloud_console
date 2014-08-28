class VolumesController < AwsController
  before_filter :set_volume, only: [:show]

  def index
    @volumes = @region.volumes.sort
  end

  private

  def set_volume
    @volume = @region.volumes.find { |needle| needle.to_param == params[:id] }
  end
end
