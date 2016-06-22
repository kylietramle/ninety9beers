class CustomBeer < ActiveRecord::Base
  include PublicActivity::Common
  
  has_one :beer
end
