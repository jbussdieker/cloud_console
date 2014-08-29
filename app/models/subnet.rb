class Subnet < Base
  include Taggable

  self.primary_key = :subnet_id

  has_many :instances
  has_many :network_interfaces
  belongs_to :vpc
end
