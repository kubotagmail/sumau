class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :customer_id, null: false
      t.integer :property_type_id, null: false
      t.integer :floor_plan_id, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.integer :price, null: false
      # t.boolean :is_active, null: false, default: true
      t.integer :sales_status,null: false, default:0

      t.timestamps
    end
  end
end
