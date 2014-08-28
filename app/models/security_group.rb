class SecurityGroup < Base
  def id
    group_id
  end

  def name
    group_name
  end

  def vpc
    Vpc.find(vpc_id, region: region)
  end

  def self.describe_result_key
    "#{name.underscore}_info"
  end
end

