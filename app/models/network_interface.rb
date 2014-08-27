class NetworkInterface < Base
  def id
    network_interface_id
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_network_interfaces
    response.data[:network_interface_set].collect { |obj| new(obj) }
  end
end
