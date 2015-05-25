class RemovePriceFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :price, :decimal, precision: 10, scale: 2
  end
end
