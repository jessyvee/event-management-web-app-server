class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendees ,:event_id
  end
end
