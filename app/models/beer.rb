class Beer < ActiveRecord::Base
  include PublicActivity::Common
  
  ratyrate_rateable 'overall_taste'
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
      api_beer = Untappd::Beer.info(api_id)
      return api_beer.beer.beer_name
    end
  end


end
