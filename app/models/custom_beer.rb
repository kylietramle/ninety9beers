class CustomBeer < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
  has_one :beer
  mount_uploader :image, BeerImageUploader
end
