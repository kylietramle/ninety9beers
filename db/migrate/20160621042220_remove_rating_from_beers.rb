class RemoveRatingFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :rating, :string
  end
end
