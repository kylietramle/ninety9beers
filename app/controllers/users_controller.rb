class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @user.beers.each do |beer|
    #   if beer.custom_beer_id
    #     @custom_beer = beer.custom_beer
    #   else
    #     @api_id = beer.api_id
    #     @api_beer = Untappd::Beer.info(@api_id)
    #   end
    # end

    # @user.beers.each do |beer|
    #   general_id = beer.id
    #   @beer = Beer.find_by(id: general_id)
    # end
  end

  def edit
    @user = User.find(params[:id])
  end
end
