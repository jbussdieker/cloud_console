class Volume < Base
  include Taggable

  self.primary_key = :volume_id

  def attachment
    raise "More than one attachment" if attachments.length > 1
    attachments.first
  end

  def attachments
    attachment_set.collect do |attachment|
      VolumeAttachment.new(attachment.merge(region: region))
    end
  end
end
