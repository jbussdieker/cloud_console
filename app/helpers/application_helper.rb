module ApplicationHelper
  def region_link(region)
    link_to region.name, region_path(region) if region
  end

  def vpc_link(region, vpc)
    link_to vpc, region_vpc_path(region, vpc) if vpc
  end

  def instance_link(region, instance)
    link_to instance, region_instance_path(region, instance) if instance
  end

  def image_link(region, image)
    link_to image, region_image_path(region, image) if image
  end

  def subnet_link(region, subnet)
    link_to subnet, region_subnet_path(region, subnet) if subnet
  end

  def address_link(region, address)
    link_to address, region_address_path(region, address) if address
  end

  def volume_link(region, volume)
    link_to volume, region_volume_path(region, volume) if volume
  end

  def security_group_link(region, security_group)
    link_to security_group, region_security_group_path(region, security_group) if security_group
  end

  def network_interface_link(region, network_interface)
    link_to network_interface, region_network_interface_path(region, network_interface) if network_interface
  end
end
