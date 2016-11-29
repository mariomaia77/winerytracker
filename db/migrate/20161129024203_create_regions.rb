class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.text :name
      t.text :location
      t.float :region_lat
      t.float :region_long
      t.text :vintages
      t.text :region_description
      t.text :region_varieties
      t.text :region_img
      t.text :region_event
      t.date :region_event_date

      t.timestamps null: false
    end
  end
end
