class VolumeAttachment < Base
  def instance
    if instance_id
      Instance.find(instance_id, region: region)
    end
  end
end
