# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstname              :string(255)
#  lastname               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  admin                  :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :firstname, :lastname, :avatar

  has_attached_file :avatar,  :styles => {:medium => "300 x 240", :thumb => "112x112#", :mini => '44x44#'}, 
  :default_url => "/images/:style/missing.png" 
  
  has_many :events, dependent: :destroy
  has_many :likes

  def full_name
    fname = ("#{firstname}".capitalize)
    lname = ("#{lastname}".capitalize)
    fullname = fname + " " + lname
  end

  def has_like?(event)
    self.likes.find(:all, :conditions => ['event_id = ?', event.id]).size > 0
  end

end
