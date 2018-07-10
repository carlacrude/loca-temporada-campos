class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :region

  validates :title, :room_quantity, :maximum_guests, :minimum_rent,
            :maximum_rent, :daily_rate,
            presence: { message: 'não pode ficar em branco' }
end
