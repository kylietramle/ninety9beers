class AddUserIdBeerIdRankToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :user_id, :integer
    add_column :beers, :api_id, :string
    add_column :beers, :rank, :integer
  end
end
