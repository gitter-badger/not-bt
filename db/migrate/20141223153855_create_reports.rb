class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :latitude
      t.float :longitude
      t.string :address, null: false
      t.string :category, null: false
      t.text :description

      t.timestamps
    end
  end
end
