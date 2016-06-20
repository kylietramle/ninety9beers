class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  validates :rating, presence: true
end