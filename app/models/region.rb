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

  def instances; @instances ||= Instance.all(:region => to_param); end
  def subnets; @subnets ||= Subnet.all(:region => to_param); end
  def vpcs; @vpcs ||= Vpc.all(:region => to_param); end
  def addresses; @addresses ||= Address.all(:region => to_param); end
  def network_interfaces; @network_interfaces ||= NetworkInterface.all(:region => to_param); end
  def images; @images ||= Image.all(:region => to_param); end
  def volumes; @volumes ||= Volume.all(:region => to_param); end
  def security_groups; @security_groups ||= SecurityGroup.all(:region => to_param); end
end
