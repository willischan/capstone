class RemoveColumnFromEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :time, :event_time
  end
end
