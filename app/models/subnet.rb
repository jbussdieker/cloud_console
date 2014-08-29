class Subnet < Base
  include Taggable

  self.primary_key = :subnet_id

  def name
    self["Name"] || subnet_id
  end

  def vpc
    Vpc.find(vpc_id, region: region)
  end
end
