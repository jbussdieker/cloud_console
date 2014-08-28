class Subnet < Base
  include Taggable

  def id
    subnet_id
  end

  def name
    self["Name"] || subnet_id
  end

  def vpc
    Vpc.find(vpc_id, region: region)
  end
end
