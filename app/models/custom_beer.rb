class CustomBeer < ActiveRecord::Base
  include PublicActivity::Common
  
  has_one :beer
  mount_uploader :image, BeerImageUploader
end
