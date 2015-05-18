class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :town, index: true
      t.references :category, polymorphic: true, index: true
      t.string :creator_name
      t.string :creator_email
      t.string :creator_phone
      t.text :description

      t.timestamps null: false
    end
  end
end
