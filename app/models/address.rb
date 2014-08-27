class Address < Base
  def id
    public_ip
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_addresses
    response.data[:addresses_set].collect { |obj| new(obj) }
  end
end
