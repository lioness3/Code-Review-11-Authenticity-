require 'rails_helper'

describe "the add review process" do
    it "adds a new review" do
      product = Product.create({:name => 'Ting', :cost => '33.00', :country_of_origin => 'NBB', :id => 3})
    visit product_path
    click_link 'Add a review'
    fill_in 'Name', :with => 'Thingy'
    fill_in 'Cost', :with => '33.33'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Your review was successfully added!'
    expect(page).to have_content 'Thingy'
  end
  # it "gives an error when no name is entered" do
  #   visit '/reviews/new'
  #   click_on 'Create Product'
  #   expect(page).to have_content "Name can't be blank"
  # end
end
