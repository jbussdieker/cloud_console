class Region < Base
  self.describe_result_key = "#{name.downcase}_info"
  self.primary_key = :region_name

  def name
    case region_name
      when "eu-west-1"
        "dublin"
      when "sa-east-1"
        "são paulo"
      when "us-east-1"
        "northern virginia"
      when "ap-northeast-1"
        "tokoyo"
      when "us-west-2"
        "oregon"
      when "us-west-1"
        "northern california"
      when "ap-southeast-1"
        "singapore"
      when "ap-southeast-2"
        "sydney"
#      when "asdfasdf"
      else
        region_name
    end
  end

  def instances; Collection.new(Instance, :region => to_param); end
  def subnets; Collection.new(Subnet, :region => to_param); end
  def vpcs; Collection.new(Vpc, :region => to_param); end
  def addresses; Collection.new(Address, :region => to_param); end
  def network_interfaces; Collection.new(NetworkInterface, :region => to_param); end
  def images; Collection.new(Image, :region => to_param); end
  def volumes; Collection.new(Volume, :region => to_param); end
  def security_groups; Collection.new(SecurityGroup, :region => to_param); end
end
