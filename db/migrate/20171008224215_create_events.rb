class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.string :event_date
      t.string :date
      t.string :image_url
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
