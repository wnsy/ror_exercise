class RemovePriceFromStock < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :price, :integer
  end
end
