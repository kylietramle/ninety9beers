class User < ActiveRecord::Base
  has_many :beers
  has_many :user_beers, through: :beers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def drank_list
    brewery_db = Beer.api_call
    beers_list = []
    number_beers = self.beers.count - 1
    (0..number_beers).each do |count|
      id = self.beers[count].id
      beers_list << Beer.find_by(id: id)
    end

    beers_list
  end
end
