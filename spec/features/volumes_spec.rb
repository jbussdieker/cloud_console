require 'rails_helper'

describe "volumes list" do
  Region.all.each do |region|
    context region.name do
      count = region.volumes.length

      it "shows #{count} volumes" do
        visit "/regions/#{region.to_param}/volumes"
        expect(page).to have_content 'Volumes'
        expect(page.all("table#volumes tbody tr").count).to eql(count)
      end
    end
  end
end
