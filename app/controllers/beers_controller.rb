class BeersController < ApplicationController
  before_action :find_beer, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
    @api_beer = Untappd::Beer.info(params[:id])
    @beer = Beer.find_by(api_id: params[:id])
  end

  def search
    if params[:beer_search].blank? && current_user
      flash[:danger] = 'Enter a beer name'

      redirect_to "/home"
    elsif params[:beer_search].blank?
      params[:beer_search].blank?
      flash[:danger] = 'Enter a beer name'
      
      redirect_to "/beers"
    else
      @beers = Untappd::Beer.search(params[:beer_search])
    end
  end

  def create
    params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(beer_name: params[:beer_name], api_id: params[:api_id], user_id: current_user.id, tap: tap_param, image: params[:image], rating: params[:stars_dropdown])
    
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
     @api_beer = Untappd::Beer.info(@beer.api_id)
  end

  def update
    params[:tap] == "Tap" ? tap_param = true : tap_param = false

    if params[:remove_image]
      @beer.remove_image!
      @beer.update(tap: tap_param, rating: params[:stars_dropdown])
      flash[:success] = 'The beer was edited!'
      @beer.create_activity :update, owner: current_user

      redirect_to "/beers/#{@beer.api_id}"
    elsif params[:image]
      @beer.update(tap: tap_param, image: params[:image], rating: params[:stars_dropdown])
      flash[:success] = 'The beer was edited!'
      @beer.create_activity :update, owner: current_user

      redirect_to "/beers/#{@beer.api_id}"
    else
      flash[:danger] = 'Error! Try again!'
      redirect_to "/beers/edit"
    end
  end

  def destroy
    if @beer.destroy
      flash[:success] = 'The beer was deleted!'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = 'Error! Try again!'
      redirect_to "/beers/#{@beer.id}"
    end
  end

  private

  def find_beer
    @beer = Beer.find(params[:id])
  end
end