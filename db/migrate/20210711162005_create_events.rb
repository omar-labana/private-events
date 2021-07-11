class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.text :location

      t.timestamps
    end
  end
end
