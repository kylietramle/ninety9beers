class ChangeUserIdBeerIdRankToBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :name, :string
    remove_column :beers, :style, :string
    remove_column :beers, :abv, :decimal
    remove_column :beers, :ibu, :integer
  end
end
