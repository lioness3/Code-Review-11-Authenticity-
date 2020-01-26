require 'rails_helper'

describe "the add product process" do
    it "adds a new product" do
      user2 = User.create!(:email => '1@66', :admin => true, :username => 'mine', :password => 6, :password_confirmation => 6, :id => 900)
      user2.save
    visit '/'
    click_link 'New Product'
    fill_in 'name', :with => 'Thingy'
    fill_in 'cost', :with => '33.33'
    fill_in 'country of origin', :with => 'USA'
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
