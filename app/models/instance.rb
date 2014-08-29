class Instance < Base
  include Taggable

  self.primary_key = :instance_id

  def vpc
    Vpc.find(vpc_id, region: region)
  end

  def subnet
    Subnet.find(subnet_id, region: region)
  end

  def groups
    group_set.collect do |group|
      SecurityGroup.find(group[:group_id], region: region) || raise("Group not found #{group[:group_id]}")
    end
  end

  def volumes
    block_device_mapping.collect do |mapping|
      if mapping[:ebs]
        Volume.find(mapping[:ebs][:volume_id], region: region)
      end
    end.compact
  end

  def network_interfaces
    network_interface_set.collect do |network_interface|
      NetworkInterface.find(network_interface[:network_interface_id], region: region)
    end
  end

  def self.describe(params = { region: "us-east-1" })
    response = client(params).send(describe_function)
    response.data[:reservation_set].collect do |rs|
      rs[:instances_set].collect do |obj|
        new(obj.merge(params).merge({:reservation_id => rs[:reservation_id]}))
      end
    end.flatten
  end
end
