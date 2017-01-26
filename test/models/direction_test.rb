# == Schema Information
#
# Table name: directions
#
#  id          :integer          not null, primary key
#  origin      :string
#  destination :string
#  winery_id   :integer
#  region_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DirectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
