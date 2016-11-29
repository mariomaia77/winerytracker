# == Schema Information
#
# Table name: wineries
#
#  id                 :integer          not null, primary key
#  name               :text
#  winery_image       :text
#  winery_admin       :boolean          default(FALSE)
#  is_winery          :boolean
#  is_certified       :boolean
#  rating             :text
#  email              :text
#  website            :text
#  winery_lat         :float
#  winery_long        :float
#  feature_wine       :text
#  winery_description :text
#  winery_pitch       :text
#  must_try_wines     :text
#  winery_event       :text
#  winery_event_date  :date
#  visit_app_only     :boolean
#  cellar_door        :boolean
#  restaurant         :boolean
#  rest_name          :text
#  open_time_cd       :datetime
#  close_time_cd      :datetime
#  open_days_cd       :text
#  open_time_rest     :datetime
#  close_time_rest    :datetime
#  open_days_rest     :text
#  region_id          :integer
#  winery_location    :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Winery < ActiveRecord::Base
  has_and_belongs_to_many :travellers
  belongs_to :region
  geocoded_by :winery_location
  after_validation :geocode
end
