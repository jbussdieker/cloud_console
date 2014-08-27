class SecurityGroup < Base
  def id
    group_id
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_security_groups
    response.data[:security_group_info].collect { |obj| new(obj) }
  end
end

