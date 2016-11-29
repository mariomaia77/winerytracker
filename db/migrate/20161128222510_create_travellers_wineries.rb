class CreateTravellersWineries < ActiveRecord::Migration
  def change
    create_table :travellers_wineries, :id => false do |t|

      t.integer :traveller_id
      t.integer :winery_id
    end
  end
end
