require 'rails_helper'

describe "network interface list" do
  Region.all.each do |region|
    context region.name do
      count = region.network_interfaces.length

      it "shows #{count} network interfaces" do
        visit "/regions/#{region.to_param}/network_interfaces"
        expect(page).to have_content 'Network Interfaces'
        expect(page.all("table#network_interfaces tbody tr").count).to eql(count)
      end
    end
  end
end
