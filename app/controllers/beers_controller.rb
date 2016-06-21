class BeersController < ApplicationController
  
  def index
  end

  def show
    @api_beer = Untappd::Beer.info(params[:id])
    @beer = Beer.find_by(api_id: params[:id])
  end

  def search
    searched_beer = params[:beer_search]
    page = params[:page] || 1
    per_page = 20
  
    @beers = Untappd::Beer.search(searched_beer)
  end

  def create
    params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(beer_name: params[:beer_name], api_id: params[:api_id], user_id: current_user.id, tap: tap_param, image: params[:image], rating: params[:stars_dropdown])
    # @beer.ratings.build(user_id: current_user.id, beer_id: @beer.id, rating: params[:stars_dropdown])
    
    if @beer.save
      flash[:success] = 'Beer was added!'
      @beer.create_activity :create, owner: current_user
      
      redirect_to "/users/#{current_user.id}"
    else

      flash[:danger] = 'Please choose a rating!'
      redirect_to "/beers/#{@beer.api_id}"
    end 
  end

  def edit
     @beer = Beer.find(params[:id])
     @api_beer = Untappd::Beer.info(@beer.api_id)
  end

  def update
     @beer = Beer.find(params[:id])
     params[:tap] == "Tap" ? tap_param = true : tap_param = false 
     if @beer.update(tap: tap_param, image: params[:image], rating: params[:stars_dropdown])
      flash[:success] = 'The beer was edited!'
      # @beer.ratings.update(user_id: current_user.id, beer_id: @beer.id, rating: params[:stars_dropdown])
      @beer.create_activity :update, owner: current_user
      
      redirect_to "/beers/#{@beer.api_id}"
    else
      flash[:danger] = 'Error! Try again!'
      redirect_to "/beers/edit"
    end
     
  end

  def destroy
    @beer = Beer.find(params[:id])
    if @beer.destroy
      flash[:success] = 'The beer was deleted!'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = 'Error! Try again!'
      redirect_to "/beers/#{@beer.id}"
    end
  end
end