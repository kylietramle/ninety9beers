class AddRatingToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :rating, :integer
  end
end
