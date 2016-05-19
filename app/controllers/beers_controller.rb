class BeersController < ApplicationController

  def index
  end

  def show
    brewery_db = Beer.api_call
    @beer = brewery_db.beers.find(params[:id])
    @user_beer = current_user.beers.find_by(api_id: params[:id])
  end

  def search
    brewery_db = Beer.api_call
    searched_beer = params[:beer_search]
    page = params[:page] || 1
    per_page = 20
  
    results = brewery_db.search.beers(q: searched_beer)
    count = results.count

    @beers = Kaminari.paginate_array(results.take(per_page), total_count: count).page(page)
  end

  def create
    if params[:tap] = "Tap"
      tap_param = true
    else
      tap_param = false
    end
    
    @beer = Beer.new(api_id: params[:api_id], user_id: current_user.id, rank: params[:rank], tap: tap_param)
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end
end