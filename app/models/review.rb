class Review < ApplicationRecord
 belongs_to :product, dependent: :destroy
 validates :author, :rating, presence: true
 validates :content_body, length: { in: 50..250 }
 scope :most_popular, -> { group(:product_id).count.sort_by(&:size) }



  def self.most_popular
   group(:product_id).count.sort_by(&:size)

  end
end
