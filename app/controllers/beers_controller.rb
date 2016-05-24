class BeersController < ApplicationController
  def index
  end

  def show
    if Beer.find_by(beer_id: params[:id])
      @type = "userbeer"
      @beer = UserBeer.find_by(id: params[:id])
       if current_user
        @user_beer = current_user.beers.find_by(beer_id: params[:id])
      end
   else 
      @type = "apibeer"
      brewery_db = Beer.api_call
      @beer = brewery_db.beers.find(params[:id])
      if current_user
        @user_beer = current_user.beers.find_by(api_id: params[:id])
      end
    end

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
    params[:tap] = "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(api_id: params[:api_id], user_id: current_user.id, rank: params[:rank], tap: tap_param)
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end

  def create_unique
    @user_beer = UserBeer.new(name: params[:name], style: params[:style], abv: params[:abv], ibu: params[:ibu], description: params[:description])
    @user_beer.save

    @beer = Beer.new(beer_id: @user_beer.id, user_id: current_user.id, rank: params[:rank], tap: params[:tap])
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end

end