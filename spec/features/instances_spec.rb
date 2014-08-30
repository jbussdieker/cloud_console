require 'rails_helper'

describe "instances" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.instances.length

        if count > 0
          it "shows instance" do
            visit region_instance_path(region, region.instances.first)
            expect(page).to have_content 'Instances'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.instances.length

        it "shows #{count} instances" do
          visit region_instances_path(region)
          expect(page).to have_content 'Instances'
          expect(page.all("table#instances tbody tr").count).to eql(count)
        end
      end
    end
  end
end
