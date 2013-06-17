class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :street
      t.string :country
      t.float :latitude
      t.float :longitude
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
