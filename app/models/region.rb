class Region < Base
  def id
    region_name
  end

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

  def instances; Instance.all(:region => to_param); end
  def subnets; Subnet.all(:region => to_param); end
  def vpcs; Vpc.all(:region => to_param); end
  def addresses; Address.all(:region => to_param); end
  def network_interfaces; NetworkInterface.all(:region => to_param); end
  def images; Image.all(:region => to_param); end
  def volumes; Volume.all(:region => to_param); end
  def security_groups; SecurityGroup.all(:region => to_param); end

  def self.describe_result_key
    "#{name.downcase}_info"
  end
end
