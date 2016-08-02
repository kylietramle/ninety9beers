class CustomBeersController < ApplicationController
  before_action :find_custom_beer, only: [:show, :edit, :update, :destroy]

  def show
    @beer = @custom_beer.beer
  end

  def create
    @custom_beer = CustomBeer.new(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])
    @custom_beer.save

    params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(custom_beer_id: @custom_beer.id, user_id: current_user.id, tap: tap_param, image: params[:image], rating: params[:stars_dropdown])
    if @beer.save
      flash[:success] = 'The beer was added to Beer Rack!'
      @custom_beer.create_activity :create, owner: current_user

      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/custom_beers/new"
    end 
  end

  def edit
    @beer = @custom_beer.beer
  end

  def new
    unless current_user
      redirect_to "/beers"
      flash[:warning] = 'Please sign up to add beers!'
    end
  end

  def update
   @custom_beer.update(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])

   @beer = @custom_beer.beer
   params[:tap] == "Tap" ? tap_param = true : tap_param = false
   if params[:remove_image]
    @beer.remove_image!
    @beer.update(custom_beer_id: @custom_beer.id, tap: tap_param, rating: params[:stars_dropdown])
    flash[:success] = 'The beer was edited!'
    @custom_beer.create_activity :update, owner: current_user

    redirect_to "/custom_beers/#{@custom_beer.id}"
    elsif params[:image]
      @beer.update(custom_beer_id: @custom_beer.id, tap: tap_param, rating: params[:stars_dropdown], image: params[:image])
      flash[:success] = 'The beer was edited!'
      @custom_beer.create_activity :update, owner: current_user

     redirect_to "/custom_beers/#{@custom_beer.id}"
    else
      flash[:danger] = 'Error! Try again!'
      redirect_to "custom_beers/#{@custom_beer.id}/edit"
    end
  end
    

  def destroy  
    if @custom_beer.beer.destroy
      flash[:success] = 'The beer was deleted!'

      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = 'An error occurred. Try deleting the beer again.'
    end
  end

  private
  
  def find_custom_beer
    @custom_beer = CustomBeer.find_by(id: params[:id])
  end
end
