require 'rails_helper'

describe "security_groups" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.security_groups.length

        if count > 0
          it "shows security group" do
            visit region_security_group_path(region, region.security_groups.first)
            expect(page).to have_content 'Security Groups'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.security_groups.length

        it "shows #{count} security groups" do
          visit region_security_groups_path(region)
          expect(page).to have_content 'Security Groups'
          expect(page.all("table#security_groups tbody tr").count).to eql(count)
        end
      end
    end
  end
end
