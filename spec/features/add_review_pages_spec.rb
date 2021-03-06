require 'rails_helper'

describe "the add review process" do
  before do
    Product.clear
    Review.clear
  end
  product2 = Product.create!({:name => 'Ting', :cost => '33.00', :country_of_origin => 'NBB', :id => 200})

    it "signs in as non-admin and adds a new review" do
      visit '/'
      click_link "Sign up"
      fill_in 'email', :with => '1@66'
      fill_in 'are you an administrator', :with => true
      fill_in 'username', :with => 'mine'
      fill_in 'password', :with => '6'
      fill_in 'password confirmation', :with => '6'
      click_on 'Sign Up'
click_link 'Ting'
    click_link 'Add a Review'
    fill_in 'author', :with => 'me'
    fill_in 'rating', :with => '1'
    fill_in 'content_body', :with => 'This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.'
    click_on 'Create Review'
    expect(page).to have_content 'Your review was successfully added!'
    expect(page).to have_content 'author: me'
  end
  it "gives an error when no name is entered" do
    visit '/reviews/new'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
