class User < ActiveRecord::Base
  
  has_many :beers
  mount_uploader :image, AvatarUploader
  ratyrate_rater
  has_many :ratings, :class_name => "Rate", :foreign_key => 'rater_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorite_beers
    ratings.where(stars: 5.0).beer
  end


end
