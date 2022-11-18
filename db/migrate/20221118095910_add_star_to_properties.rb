class AddStarToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :star, :integer
  end
end
