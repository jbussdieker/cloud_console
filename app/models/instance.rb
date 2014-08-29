class Instance < Base
  include Taggable

  self.primary_key = :instance_id

  has_many :network_interfaces
  belongs_to :vpc
  belongs_to :subnet

  def security_groups
    group_set.collect do |group|
      SecurityGroup.find(group[:group_id], region: region) || raise("Group not found #{group[:group_id]}")
    end
  end

  alias_method :groups, :security_groups

  def volumes
    block_device_mapping.collect do |mapping|
      if mapping[:ebs]
        Volume.find(mapping[:ebs][:volume_id], region: region)
      end
    end.compact
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
