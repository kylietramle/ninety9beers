class RenameUserBeerToCustomBeer < ActiveRecord::Migration
  def change
    rename_table :user_beers, :custom_beers
  end
end
