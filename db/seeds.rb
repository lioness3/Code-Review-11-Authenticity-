require 'faker'

50.times do
  Product.create! do |product|
    product.name = Faker::Appliance.unique.equipment
    product.cost =  Faker::Commerce.price(range: 0..300.00)
    product.country_of_origin = Faker::Address.country
    5.times do
      product.reviews.new do |review|
       review.author = Faker::Superhero.name
        review.content_body =
        Faker::Hipster.paragraph_by_chars(characters: 123, supplemental: false)
        review.rating = Faker::Number.within(range: 1..5)
        review.product_id = Faker::Number.within(range: 1..50)
      end
    end
  end
end
