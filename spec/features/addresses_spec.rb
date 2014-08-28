require 'rails_helper'

describe "addresses list" do
  Region.all.each do |region|
    context region.name do
      count = region.addresses.length

      it "shows #{count} addresses" do
        visit "/regions/#{region.to_param}/addresses"
        expect(page).to have_content 'Addresses'
        expect(page.all("table#addresses tbody tr").count).to eql(count)
      end
    end
  end
end
