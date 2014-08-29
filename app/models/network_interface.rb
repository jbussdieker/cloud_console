class NetworkInterface < Base
  include Taggable

  self.primary_key = :network_interface_id

  belongs_to :vpc
  belongs_to :subnet
  belongs_to :instance

  def instance_id
    attachment[:instance_id] if attachment
  end
end
