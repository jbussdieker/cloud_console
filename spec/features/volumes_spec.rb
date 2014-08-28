require 'rails_helper'

describe "volumes" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.volumes.length

        if count > 0
          it "shows volume" do
            visit region_volumes_path(region, region.volumes.first)
            expect(page).to have_content 'Volumes'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.volumes.length

        it "shows #{count} volumes" do
          visit region_volumes_path(region)
          expect(page).to have_content 'Volumes'
          expect(page.all("table#volumes tbody tr").count).to eql(count)
        end
      end
    end
  end
end
