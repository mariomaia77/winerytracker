class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.text :first_name
      t.text :last_name
      t.string :email
      t.text :image
      t.date :dob
      t.text :password_digest
      t.boolean :admin, :default => false
      t.string :phone
      t.text :city
      t.text :country
      t.float :lat
      t.float :long
      t.text :fav_winery
      t.text :fav_region
      t.text :fav_variety

      t.timestamps null: false
    end
  end
end
