class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :customer_id, null: false
      t.integer :property_type_id, null: false
      t.integer :floor_plan_id, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :sales_status, null: false, default: 0
      t.integer :star, null: true, default: 0
      t.float :latitude
      t.float :longitude
      t.string :name
      t.timestamps
    end
  end
end
