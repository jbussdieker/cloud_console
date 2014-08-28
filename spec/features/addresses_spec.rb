require 'rails_helper'

describe "addresses" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.addresses.length

        if count > 0
          it "shows address" do
            visit region_address_path(region, region.addresses.first)
            expect(page).to have_content 'Addresses'
          end
        end
      end
    end
  end

  context "index" do
    Region.all.each do |region|
      context region.name do
        count = region.addresses.length

        it "shows #{count} addresses" do
          visit region_addresses_path(region)
          expect(page).to have_content 'Addresses'
          expect(page.all("table#addresses tbody tr").count).to eql(count)
        end
      end
    end
  end
end
