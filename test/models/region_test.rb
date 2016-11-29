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

require 'test_helper'

class RegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
