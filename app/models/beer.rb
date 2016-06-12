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


end
