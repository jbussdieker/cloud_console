require 'rails_helper'

describe "images list" do
  Region.all.each do |region|
    context region.name do
      count = region.images.length

      it "shows #{count} images" do
        visit region_images_path(region)
        expect(page).to have_content 'Images'
        expect(page.all("table#images tbody tr").count).to eql(count)
      end
    end
  end
end
