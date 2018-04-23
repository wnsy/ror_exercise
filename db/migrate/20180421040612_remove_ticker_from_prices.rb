class RemoveTickerFromPrices < ActiveRecord::Migration[5.1]
  def change
    remove_column :prices, :ticker, :string
  end
end
