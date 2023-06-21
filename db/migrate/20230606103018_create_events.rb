class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date   :date
      t.string :category
      t.string :description
    end
  end
end
