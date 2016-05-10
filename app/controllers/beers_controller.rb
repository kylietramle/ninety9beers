class BeersController < ApplicationController
  def index
    brewery_db = Beer.api_call
    @beers = brewery_db.search.beers(q: 'IPA').limit(10)
  end

  def show
    brewery_db = Beer.api_call
    @beer = brewery_db.beers.find(params[:id])
  end

  def create
  end

  def search
    brewery_db = Beer.api_call
    searched_beer = params[:beer_search]
    @beers = brewery_db.search.all(q: searched_beer)
    puts @beers
  end
end