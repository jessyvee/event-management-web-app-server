class CreateSubscribers < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :category
      t.string :newsletter_id
    end
  end
end
