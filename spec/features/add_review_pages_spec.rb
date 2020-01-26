require 'rails_helper'

describe "the add review process" do
    it "adds a new review" do
      product2 = Product.create!({:name => 'Ting', :cost => '33.00', :country_of_origin => 'NBB', :id => 55})
      product2.save
      user = User.create(:email => '1@66', :admin => true, :username => 'mine', :password => 6, :password_confirmation => 6, :id => 900)
      user.save
    visit '/products/55'
    click_link 'Add a Review'
    fill_in 'author', :with => 'me'
    fill_in 'rating', :with => '1'
    fill_in 'content_body', :with => 'This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.This is a string a string that is atleast 50 characters.'
    click_on 'Create Review'
    expect(page).to have_content 'Your review was successfully added!'
    expect(page).to have_content 'author: me'
  end
  # it "gives an error when no name is entered" do
  #   visit '/reviews/new'
  #   click_on 'Create Product'
  #   expect(page).to have_content "Name can't be blank"
  # end
end
