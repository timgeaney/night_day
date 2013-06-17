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

class Event < ActiveRecord::Base
  attr_accessible :category, 
                  :title, 
                  :description,
                  :street,
                  :country,
                  :latitude,
                  :longitude,
                  :date,
                  :time


                  
end
