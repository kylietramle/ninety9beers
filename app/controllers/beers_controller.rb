class BeersController < ApplicationController
  def index
  end

  def show
    # Show page for API beers
    @beer = Untappd::Beer.info(params[:id])
    @api_beer = Beer.find_by(api_id: params[:id])

  end

  def search
    searched_beer = params[:beer_search]
    page = params[:page] || 1
    per_page = 20
  
    @beers = Untappd::Beer.search(searched_beer)
    # count = results.count

    # @beers = Kaminari.paginate_array(results.take(per_page), total_count: count).page(page)
  end

  def create
    params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(api_id: params[:api_id], user_id: current_user.id, rank: params[:rank], tap: tap_param)
    @beer.save

    redirect_to "/users/#{current_user.id}"
  end

  def edit
     @beer = Beer.find(params[:id])
  end

  def update
     @beer = Beer.find(params[:id])
     params[:tap] == "Tap" ? tap_param = true : tap_param = false 
     @beer.update(rank: params[:rank], tap: tap_param)

     redirect_to "/beers/#{@beer.api_id}"
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    redirect_to "/users/#{current_user.id}"
  end
end