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

  def instances
    Instance.all(region: region).find_all do |instance|
      instance.groups.find { |group| group.id == id } != nil
    end
  end

  def self.describe_result_key
    "#{name.underscore}_info"
  end
end

