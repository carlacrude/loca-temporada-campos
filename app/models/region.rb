class Region < ApplicationRecord
  has_many :properties

  validates :name, presence: { message: 'não pode ficar em branco' }
end
