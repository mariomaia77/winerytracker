class AddLocationColumnsToTraveller < ActiveRecord::Migration
  def change
    add_column :travellers, :location, :string
  end
end
