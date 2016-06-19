class RemoveRankFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :rank
  end
end
