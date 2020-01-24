require 'rails_helper'

describe "the add product process" do
    it "adds a new product" do
    visit root_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Thingy'
    fill_in 'Cost', :with => '33.33'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Your product was successfully added!'
    expect(page).to have_content 'Thingy'
  end
  it "gives an error when no name is entered" do
    visit '/products/new'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
