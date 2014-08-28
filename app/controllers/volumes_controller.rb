class VolumesController < AwsController
  before_filter :set_region
  before_filter :set_volume, only: [:show]

  def index
    @volumes = @region.volumes
  end

  private

  def set_volume
    @volume = @region.volumes.find { |needle| needle.to_param == params[:id] }
  end

  def set_region
    @region = Region.find(params[:region_id])
  end
end
