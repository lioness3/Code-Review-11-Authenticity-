require 'rails_helper'


describe Product do
  it 'test private method' do
  product = Product.new(:name => 'dont test', :cost => 44.44, :country_of_origin => 'usa', :id => nil )
  product.save
    expect(product.name).to eq('Dont Test')

  end

  it { should have_many(:reviews) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:country_of_origin) }

end
