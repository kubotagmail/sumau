class CreateFloorPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :floor_plans do |t|

      t.timestamps
      
      t.string :name, null: false
      
      
    end
  end
end
