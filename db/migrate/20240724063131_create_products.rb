class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
