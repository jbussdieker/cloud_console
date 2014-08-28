class Image < Base
  def id
    image_id
  end

  def self.describe(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_images(:owners => ["self"])
    response.data[:images_set].collect { |obj| new(obj.merge(params)) }
  end
end
