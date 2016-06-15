class User < ActiveRecord::Base
  
  has_many :beers
  mount_uploader :image, AvatarUploader
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # def favorite_beers
  #   ratings = []
  #   ratings = Rate.where(rater_id: self.id)
  #   ratings.each do |rating|
  #     ratings << rating if rating.stars == 5
  #   end

  #   beers = []
  #   ratings.each do |rating|
  #     if rating.rateable_type == "CustomBeer"
  #       @top_custom_beer = CustomBeer.find_by(id: rating.rateable_id)
  #       beers << @top_custom_beer
  #     else
  #       @top_beer = Beer.find_by(id: rating.rateable_id)
  #       beers << @top_custom_beer
  #     end
  #   end

  #   beers
  # end


end
