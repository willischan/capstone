class RemoveColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :date, :string
  end
end
