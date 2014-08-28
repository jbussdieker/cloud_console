require 'rails_helper'

describe "vpcs list" do
  Region.all.each do |region|
    context region.name do
      count = region.vpcs.length

      it "shows #{count} vpcs" do
        visit region_vpcs_path(region)
        expect(page).to have_content 'VPCs'
        expect(page.all("table#vpcs tbody tr").count).to eql(count)
      end
    end
  end
end
