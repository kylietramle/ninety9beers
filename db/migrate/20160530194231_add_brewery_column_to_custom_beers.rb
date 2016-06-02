class AddBreweryColumnToCustomBeers < ActiveRecord::Migration
  def change
    add_column :custom_beers, :brewery, :string
  end
end
