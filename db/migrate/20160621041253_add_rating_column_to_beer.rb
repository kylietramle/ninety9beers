class AddRatingColumnToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :rating, :string
  end
end
