class AddPriceToAds < ActiveRecord::Migration
  def change
    add_column :ads, :price, :decimal, precision: 10, scale: 2
  end
end
