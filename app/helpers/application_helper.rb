module ApplicationHelper
  def region_link(region)
    link_to region.name, region_path(region) if region
  end
end
