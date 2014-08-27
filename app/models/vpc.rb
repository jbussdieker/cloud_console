class Vpc < Base
  def id
    vpc_id
  end

  def name
    vpc_id
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_vpcs
    response.data[:vpc_set].collect { |obj| new(obj) }
  end
end
