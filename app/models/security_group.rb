class SecurityGroup < Base
  def id
    group_id
  end

  def self.describe_result_key
    "#{name.underscore}_info"
  end
end

