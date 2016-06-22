class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @paginable_beers = Kaminari.paginate_array(@user.beers).page(params[:page]).per(16)
  end

  def edit
    @user = User.find(params[:id])
  end
end
