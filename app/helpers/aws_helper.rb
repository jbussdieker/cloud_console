module AwsHelper
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

  def instance_state(state)
    if state[:name] == "running"
      content_tag(:span, state[:name], class: 'label label-success')
    elsif state[:name] == "terminated"
      content_tag(:span, state[:name], class: 'label label-danger')
    elsif state[:name] == "stopped"
      content_tag(:span, state[:name], class: 'label label-default')
    else
      state
    end
  end

  def network_interface_status(status)
    render_status(status)
  end

  def attachment_status(status)
    if status == "attached"
      content_tag(:span, status, class: 'label label-success')
    else
      content_tag(:span, status, class: 'label label-default')
    end
  end

  def volume_status(status)
    render_status(status)
  end

  def subnet_state(state)
    render_state(state)
  end

  def image_state(state)
    render_state(state)
  end

  def vpc_state(state)
    render_state(state)
  end

  def instance_status(instance_status)
    return unless instance_status

    passed = 0
    count = 0

    (instance_status.system_status[:details] + instance_status.instance_status[:details]).each do |check|
      count += 1
      passed += 1 if check[:status] == "passed"
    end

    result = "#{passed}/#{count} passing"

    if count == passed
      content_tag(:span, result, class: 'label label-success')
    elsif passed > 0
      content_tag(:span, result, class: 'label label-warning')
    else
      content_tag(:span, result, class: 'label label-danger')
    end
  end

  private

  def render_status(status)
    if status == "in-use"
      content_tag(:span, status, class: 'label label-success')
    elsif status == "available"
      content_tag(:span, status, class: 'label label-warning')
    else
      content_tag(:span, status, class: 'label label-default')
    end
  end

  def render_state(state)
    if state == "available"
      content_tag(:span, state, class: 'label label-success')
    else
      content_tag(:span, state, class: 'label label-default')
    end
  end
end
