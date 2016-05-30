class ChangeBeerIdToCustomBeerIdInBeers < ActiveRecord::Migration
  def change
    rename_column :beers, :beer_id, :custom_beer_id
  end
end
