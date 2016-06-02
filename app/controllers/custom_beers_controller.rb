class CustomBeersController < ApplicationController
  def show
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @general_beer = @custom_beer.beer
  end

  def create
    @custom_beer = CustomBeer.new(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])
    @custom_beer.save

    @beer = Beer.new(custom_beer_id: @custom_beer.id, user_id: current_user.id, rank: params[:rank], tap: params[:tap])
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @general_beer = @custom_beer.beer
  end

  def new
  end

  def update
     @custom_beer = CustomBeer.find_by(id: params[:id])
     @custom_beer.update(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])
     
     @beer = @custom_beer.beer
     @beer.update(custom_beer_id: @custom_beer.id, rank: params[:rank], tap: params[:tap])

     redirect_to "/custom_beers/#{@custom_beer.id}"
  end

  def destroy
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @custom_beer.beer.destroy
    @custom_beer.destroy

    redirect_to "/users/#{current_user.id}"
  end
end
