class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :postal_code,      null: false
      t.integer :area_id,         null: false
      t.text    :municipality,    null: false
      t.string  :address,         null: false
      t.text    :building_name,   null: false
      t.string  :phone_number,    null: false
      t.references :order,        foreign_key: true 
      t.timestamps
    end
  end
end
