class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.references :state, index: true

      t.timestamps null: false
    end
  end
end
