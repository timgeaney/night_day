# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  category    :string(255)
#  description :string(255)
#  street      :string(255)
#  country     :string(255)
#  latitude    :float
#  longitude   :float
#  date        :date
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
