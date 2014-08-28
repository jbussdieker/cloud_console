require 'rails_helper'

describe "security group list" do
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
