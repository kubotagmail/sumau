class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :customer_id
      t.integer :property_type_id
      t.integer :floor_type_id

      t.timestamps
    end
  end
end
