class RemoveStockToPrices < ActiveRecord::Migration[5.1]
  def change
    remove_reference :prices, :stock, foreign_key: true
  end
  def change
    add_reference :prices, :stock, foreign_key: true
    t.belongs_to :stock, index: true
  end
end
