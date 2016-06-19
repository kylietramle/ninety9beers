class User < ActiveRecord::Base
  
  has_many :beers, -> { order "created_at DESC" }
  has_many :ratings
  mount_uploader :image, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorite_beers
    ratings.where(stars: 5.0)
  end


end
