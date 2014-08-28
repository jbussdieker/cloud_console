require 'rails_helper'

describe "network_interfaces" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.network_interfaces.length

        if count > 0
          it "shows network interface" do
            visit region_network_interfaces_path(region, region.network_interfaces.first)
            expect(page).to have_content 'Network Interfaces'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.network_interfaces.length

        it "shows #{count} network interfaces" do
          visit region_network_interfaces_path(region)
          expect(page).to have_content 'Network Interfaces'
          expect(page.all("table#network_interfaces tbody tr").count).to eql(count)
        end
      end
    end
  end
end
