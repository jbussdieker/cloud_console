class Vpc < Base
  include Taggable

  self.primary_key = :vpc_id

  def subnets
    Subnet.all(region: region).find_all do |subnet|
      subnet.vpc_id == id
    end
  end

  def groups
    SecurityGroup.all(region: region).find_all do |group|
      group.vpc_id == id
    end
  end
end
