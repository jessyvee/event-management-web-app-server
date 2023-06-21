class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :event_id
      t.string :newsletter_id
    end
  end
end
