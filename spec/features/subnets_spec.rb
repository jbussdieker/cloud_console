require 'rails_helper'

describe "subnets" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.subnets.length

        if count > 0
          it "shows subnet" do
            visit region_subnets_path(region, region.subnets.first)
            expect(page).to have_content 'Subnets'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.subnets.length

        it "shows #{count} subnets" do
          visit region_subnets_path(region)
          expect(page).to have_content 'Subnets'
          expect(page.all("table#subnets tbody tr").count).to eql(count)
        end
      end
    end
  end
end
