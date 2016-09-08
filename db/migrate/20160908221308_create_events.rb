class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :timestamp
      t.string :hostname
      t.belongs_to :org, foreign_key: true

      t.timestamps
    end
  end
end
