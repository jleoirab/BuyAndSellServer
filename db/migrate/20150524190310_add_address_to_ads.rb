class AddAddressToAds < ActiveRecord::Migration
  def change
    add_column :ads, :address, :string
  end
end
