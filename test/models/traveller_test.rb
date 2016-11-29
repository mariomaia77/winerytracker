# == Schema Information
#
# Table name: travellers
#
#  id              :integer          not null, primary key
#  first_name      :text
#  last_name       :text
#  email           :string
#  image           :text
#  dob             :date
#  password_digest :text
#  admin           :boolean          default(FALSE)
#  phone           :string
#  city            :text
#  country         :text
#  lat             :float
#  long            :float
#  fav_winery      :text
#  fav_region      :text
#  fav_variety     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location        :string
#

require 'test_helper'

class TravellerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
