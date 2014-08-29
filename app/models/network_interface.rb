class NetworkInterface < Base
  self.primary_key = :network_interface_id

  def vpc
    Vpc.find(vpc_id, region: region)
  end

  def subnet
    Subnet.find(subnet_id, region: region)
  end

  def instance
    if attachment
      Instance.find(attachment[:instance_id], region: region)
    end
  end
end
