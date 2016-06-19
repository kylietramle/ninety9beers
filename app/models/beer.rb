class Beer < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :custom_beer
  belongs_to :user
  has_many :ratings
  mount_uploader :image, BeerImageUploader

  def get_rating(user)
    rating = Rating.find_by(user_id: user.id, beer_id: self.id)
  end

  def tap_convert
    if tap
      "Tap"
    else
      "Bottled"
    end
  end

  def name
    if custom_beer_id
      return custom_beer.name
    else
      api_beer = Untappd::Beer.info(api_id)
      return api_beer.beer.beer_name
    end
  end

  def url
    if custom_beer_id
      return "/custom_beers/#{custom_beer_id}"
    else
      return "/beers/#{api_id}"
    end
  end


end
