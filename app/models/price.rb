class Price < ApplicationRecord
  belongs_to :stock, required: false
  #validates :ticker_id, presence: true
end
