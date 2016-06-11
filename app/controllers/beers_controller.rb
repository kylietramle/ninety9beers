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
    @beer = Beer.new(api_id: params[:api_id], user_id: current_user.id, rank: params[:rank], tap: tap_param, image: params[:image])
    
    if @beer.save
      flash[:success] = 'The beer was added to Beer Rack!'
      @beer.create_activity :create, owner: current_user
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/beers/#{params[:api_id]}"
    end 
  end

  def edit
     @beer = Beer.find(params[:id])
  end

  def update
     @beer = Beer.find(params[:id])
     params[:tap] == "Tap" ? tap_param = true : tap_param = false 
     if @beer.update(rank: params[:rank], tap: tap_param, image: params[:image])
      flash[:success] = 'The beer was edited!'
      @beer.create_activity :update, owner: current_user
      redirect_to "/beers/#{@beer.api_id}"
    else
      redirect_to "/beers/edit"
    end
     
  end

  def destroy
    @beer = Beer.find(params[:id])
    if @beer.destroy
      flash[:success] = 'The beer was deleted!'
    else
      flash[:error] = 'An error occurred. Try deleting the beer again.'
    end

    redirect_to "/users/#{current_user.id}"
  end
end