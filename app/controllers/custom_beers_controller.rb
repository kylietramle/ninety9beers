class CustomBeersController < ApplicationController
  def show
    @general_beer = Beer.find_by(id: params[:id])
    @custom_beer = general_beer.custom_beer
  end

  def create
    @custom_beer = CustomBeer.new(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], description: params[:description])
    @custom_beer.save

    @beer = Beer.new(custom_beer_id: @custom_beer.id, user_id: current_user.id, rank: params[:rank], tap: params[:tap])
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end
end
