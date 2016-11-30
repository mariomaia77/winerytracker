# == Schema Information
#
# Table name: regions
#
#  id                 :integer          not null, primary key
#  name               :text
#  location           :text
#  region_lat         :float
#  region_long        :float
#  vintages           :text
#  region_description :text
#  region_varieties   :text
#  region_img         :text
#  region_event       :text
#  region_event_date  :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Region < ActiveRecord::Base
  has_many :wineries
  has_many :travellers, :through => :wineries
  geocoded_by :location, :latitude  => :region_lat, :longitude => :region_long # ActiveRecord
  after_validation :geocode
end
