class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :address
      t.string :yelp_url

      t.timestamps
    end
  end
end
