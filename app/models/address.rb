class Address < Base
  self.describe_result_key = "addresses_set"

  def id
    public_ip
  end

  def instance
    Instance.find(instance_id, region: region)
  end
end
