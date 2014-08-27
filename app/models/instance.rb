class Instance < Base
  def id
    instance_id
  end

  def self.all(params = { region: "us-east-1" })
    ec2 = AWS::EC2.new(params)
    client = ec2.client
    response = client.describe_instances
    Rails.logger
    response.data[:reservation_set].collect do |rs|
      rs[:instances_set].collect do |obj|
        new(obj.merge({:reservation_id => rs[:reservation_id]}))
      end
    end.flatten
  end
end
