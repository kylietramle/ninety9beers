class Beer < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :custom_beer
  belongs_to :user
  mount_uploader :image, BeerImageUploader

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
      return beer_name
    end
  end

  def url
    if custom_beer_id
      return "/custom_beers/#{custom_beer_id}"
    else
      return "/beers/#{api_id}"
    end
  end

  # def self.find_api_beer(id)
  #   if Beer.find_by(api_id: id)
  #     return Beer.find_by(api_id: id)
  #   else
  #     return Untappd::Beer.info(id)
  #   end
  # end


end
