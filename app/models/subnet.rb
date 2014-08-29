class Subnet < Base
  include Taggable

  self.primary_key = :subnet_id

  def vpc
    Vpc.find(vpc_id, region: region)
  end
end
