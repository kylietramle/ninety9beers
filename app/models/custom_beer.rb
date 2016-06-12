class CustomBeer < ActiveRecord::Base
  include PublicActivity::Common
  
  ratyrate_rateable 'overall_taste'
  has_one :beer
  mount_uploader :image, BeerImageUploader
end
