class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,              null: false
      t.text :product_detail,              null: false
      t.integer :price,                    null: false
      t.integer :category_id,              null: false
      t.integer :product_condition_id,     null: false
      t.integer :delivery_fee_id,          null: false
      t.integer :area_id,                  null: false
      t.integer :days_to_ship_id,          null: false
      t.references :user,                  foreign_key: true 

      t.timestamps
    end
  end
end

