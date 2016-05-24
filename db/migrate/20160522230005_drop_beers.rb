class DropBeers < ActiveRecord::Migration
  def change
    drop_table :beers
  end
end
