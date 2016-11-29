class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.text :name
      t.text :winery_image
      t.boolean :winery_admin, :default => false
      t.boolean :is_winery
      t.boolean :is_certified
      t.text :rating
      t.text :email
      t.text :website
      t.float :winery_lat
      t.float :winery_long
      t.text :feature_wine
      t.text :winery_description
      t.text :winery_pitch
      t.text :must_try_wines
      t.text :winery_event
      t.date :winery_event_date
      t.boolean :visit_app_only
      t.boolean :cellar_door
      t.boolean :restaurant
      t.text :rest_name
      t.datetime :open_time_cd
      t.datetime :close_time_cd
      t.text :open_days_cd
      t.datetime :open_time_rest
      t.datetime :close_time_rest
      t.text :open_days_rest
      t.integer :region_id
      t.text :winery_location

      t.timestamps null: false
    end
  end
end
