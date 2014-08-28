class Address < Base
  def id
    public_ip
  end

  def self.describe_result_key
    "addresses_set"
  end
end
