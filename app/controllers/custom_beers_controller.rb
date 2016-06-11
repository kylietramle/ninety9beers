class CustomBeersController < ApplicationController
  def show
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @general_beer = @custom_beer.beer
  end

  def create
    @custom_beer = CustomBeer.new(name: params[:name], image: params[:image], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])
    @custom_beer.save

    params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    @beer = Beer.new(custom_beer_id: @custom_beer.id, user_id: current_user.id, rank: params[:rank], tap: params[:tap], image: params[:image])
    if @beer.save
      @custom_beer.create_activity :create, owner: current_user
      flash[:success] = 'The beer was added to Beer Rack!'
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/custom_beers/new"
    end 

   
  end

  def edit
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @general_beer = @custom_beer.beer
  end

  def new
  end

  def update
     @custom_beer = CustomBeer.find_by(id: params[:id])
     @custom_beer.update(name: params[:name], image: params[:image], style: params[:style], abv: params[:abv], ibu: params[:ibu], brewery: params[:brewery], description: params[:description])

     @beer = @custom_beer.beer
     params[:tap] == "Tap" ? tap_param = true : tap_param = false 
    if @beer.update(custom_beer_id: @custom_beer.id, rank: params[:rank], tap: params[:tap], image: params[:image])
      flash[:success] = 'The beer was edited!'
      @custom_beer.create_activity :update, owner: current_user
      redirect_to "/custom_beers/#{@custom_beer.id}"
    else
      redirect_to "custom_beers/edit"
    end
     
  end

  def destroy
    @custom_beer = CustomBeer.find_by(id: params[:id])
    @custom_beer.beer.destroy

    if @custom_beer.destroy
      flash[:success] = 'The beer was deleted!'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:error] = 'An error occurred. Try deleting the beer again.'
    end
    
  end
end
