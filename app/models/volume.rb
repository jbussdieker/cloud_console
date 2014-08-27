class Volume < Base
  def id
    volume_id
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_volumes
    response.data[:volume_set].collect { |obj| new(obj) }
  end
end
