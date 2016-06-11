class CustomBeer < ActiveRecord::Base
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }
  
  has_one :beer
  mount_uploader :image, BeerImageUploader
end
