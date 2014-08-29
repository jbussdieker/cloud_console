class Vpc < Base
  include Taggable

  self.primary_key = :vpc_id

  has_many :subnets
  has_many :security_groups
  has_many :instances

  alias_method :groups, :security_groups
end
