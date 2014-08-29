class NetworkInterface < Base
  self.primary_key = :network_interface_id

  def name
    id
  end

  def sort_key
    :sort_hack
  end

  def sort_hack
    if instance
      instance.name
    else
      id
    end
  end

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
