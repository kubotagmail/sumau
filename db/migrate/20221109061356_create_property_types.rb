class CreatePropertyTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :property_types do |t|

      t.timestamps
      
      t.string :name, null: false
      
    end
  end
end
