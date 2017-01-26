class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :origin
      t.string :destination
      t.integer :winery_id
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
