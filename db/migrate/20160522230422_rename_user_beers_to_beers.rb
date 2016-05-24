class RenameUserBeersToBeers < ActiveRecord::Migration
  def change
    rename_table :user_beers, :beers
  end
end
