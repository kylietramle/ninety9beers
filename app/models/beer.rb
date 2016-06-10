class Beer < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  
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


  def get_url
    if self.api_id
      return "/beers/#{self.api_id}"
    else
      return "/beers/custom/#{self.id}"
    end
  end

end
