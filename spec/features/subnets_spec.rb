require 'rails_helper'

describe "subnets list" do
  Region.all.each do |region|
    context region.name do
      count = region.subnets.length

      it "shows #{count} subnets" do
        visit "/regions/#{region.to_param}/subnets"
        expect(page).to have_content 'Subnets'
        expect(page.all("table#subnets tbody tr").count).to eql(count)
      end
    end
  end
end
