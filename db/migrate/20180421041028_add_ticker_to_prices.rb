class AddTickerToPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :prices, :ticker, foreign_key: true
  end
  add_index :prices, [:ticker_id, :created_at]
end
