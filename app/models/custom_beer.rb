class CustomBeer < ActiveRecord::Base
  include PublicActivity::Common
  
  validates :name, :presence => { :message => "Rating is required!" }
  validates :style, :presence => { :message => "Style is required!" }
  has_one :beer
end