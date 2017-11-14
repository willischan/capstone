class AddColumnsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :zip_code, :string
  end
end
