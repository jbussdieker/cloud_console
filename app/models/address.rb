class Address < Base
  self.describe_result_key = "addresses_set"
  self.primary_key = :public_ip

  def instance
    Instance.find(instance_id, region: region)
  end
end
