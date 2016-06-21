class AddBeerNameToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :beer_name, :string
  end
end
