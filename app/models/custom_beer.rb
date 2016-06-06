class CustomBeer < ActiveRecord::Base
  has_one :beer
  mount_uploader :image, BeerImageUploader
end
