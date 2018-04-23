class DropStockPricesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :stock_prices
  end
end
