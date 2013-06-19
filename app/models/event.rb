# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  category           :string(255)
#  description        :string(255)
#  street             :string(255)
#  country            :string(255)
#  latitude           :float
#  longitude          :float
#  date               :date
#  time               :time
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  image_remote_url   :string(255)
#  user_id            :integer
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
                  :time,
                  :image_remote_url,
                  :photo

  has_attached_file :photo, :styles => {:large => "400 x 300", :medium => "300 x 240", :thumb => "100 x 100"},
                   :default_url => "/images/:style/missing.png" 

  validates :user_id, presence: true
  validates :description, presence: true
  validates_attachment :photo, presence: true,
                               content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                               size: { less_than: 5.megabytes }

  belongs_to :user
  has_many :likes

  default_scope order: 'events.created_at DESC'


  def image_remote_url=(url_value)
  	self.photo = URI.parse(url_value) unless url_value.blank?
  end
                  
end
