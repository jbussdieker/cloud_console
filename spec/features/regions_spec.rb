require 'rails_helper'

describe "regions list" do
  it "shows 8 region links" do
    visit regions_path
    expect(page).to have_content 'Regions'
    expect(page.all("ul#regions li a").count).to eql(8)
  end
end
