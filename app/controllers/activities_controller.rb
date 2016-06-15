class ActivitiesController < ApplicationController
  def index
    if current_user
      @activities = PublicActivity::Activity.order("created_at DESC").limit(40)
    else
      redirect_to "/beers"
    end
  end
end
