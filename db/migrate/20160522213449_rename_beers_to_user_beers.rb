class RenameBeersToUserBeers < ActiveRecord::Migration
  def change
    rename_table :beers, :user_beers
  end
end