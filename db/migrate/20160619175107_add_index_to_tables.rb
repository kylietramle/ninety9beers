class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :beers, :id
    add_index :beers, :api_id
    add_index :beers, :custom_beer_id

    add_index :ratings, :rating
  end
end
