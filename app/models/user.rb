class User < ActiveRecord::Base
  
  has_many :beers
  mount_uploader :image, AvatarUploader
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
