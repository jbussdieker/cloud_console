require 'rails_helper'

describe "images" do
  context "show" do
    Region.all.each do |region|
      context region.name do
        count = region.images.length

        if count > 0
          it "shows image" do
            visit region_image_path(region, region.images.first)
            expect(page).to have_content 'Images'
          end
        end
      end
    end
  end

  context "index" do
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
end
