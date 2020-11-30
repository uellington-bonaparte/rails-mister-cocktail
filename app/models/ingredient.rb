class Ingredient < ApplicationRecord
  # An ingredient has many doses
  has_many :doses

  validates :name, presence: true, uniqueness: true
end
