class Stock < ApplicationRecord
  belongs_to :business, required: false
end
