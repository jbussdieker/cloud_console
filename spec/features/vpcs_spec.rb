require 'rails_helper'

describe "vpcs" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.vpcs.length

        if count > 0
          it "shows vpc" do
            visit region_vpcs_path(region, region.vpcs.first)
            expect(page).to have_content 'VPCs'
          end
        end
      end
    end
  end

  context "index" do
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
end
