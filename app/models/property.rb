class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :region
  has_many :proposals

  validates :title, :room_quantity, :maximum_guests, :minimum_rent, :maximum_rent, :daily_rate, presence: { message: 'não pode ficar em branco' }

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
