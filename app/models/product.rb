class Product < ApplicationRecord
  before_save(:titleize_product)

  scope :USA, -> { where("country_of_origin like ?", "%United States%" ) }

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}

  has_many :reviews, :dependent => :delete_all

  validates :name, :cost, :country_of_origin, presence: true

private
  def titleize_product
    self.name = self.name.titleize
  end

  def self.usa
  where("country_of_origin like ?", "%United States%" || "%US%" || "%united states%" || "%us%" )
  end


  def self.three_most_recent
    order(created_at:  :desc).limit(3)
  end

end
