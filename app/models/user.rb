class User < ActiveRecord::Base
  has_many :beers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def drank_list
    brewery_db = Beer.api_call
    beers_list = []
    number_beers = self.beers.count - 1
    (0..number_beers).each do |count|
      api_id = self.beers[count].api_id
      beers_list << brewery_db.beers.find(api_id)
    end

    beers_list
  end
end
