class Stock < ApplicationRecord
  belongs_to :business, required: false
  has_many :prices
end
