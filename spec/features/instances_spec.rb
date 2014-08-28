require 'rails_helper'

describe "instances list" do
  Region.all.each do |region|
    context region.name do
      count = region.instances.length

      it "shows #{count} instances" do
        visit "/regions/#{region.to_param}/instances"
        expect(page).to have_content 'Instances'
        expect(page.all("table#instances tbody tr").count).to eql(count)
      end
    end
  end
end
