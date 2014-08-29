class Address < Base
  self.describe_result_key = "addresses_set"
  self.primary_key = :public_ip

  belongs_to :instance
end
