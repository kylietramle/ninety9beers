class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    user_beers = @user.beers

    @paginable_beers = Kaminari.paginate_array(user_beers).page(params[:page]).per(16)
  end

  def edit
    @user = User.find(params[:id])
  end
end
