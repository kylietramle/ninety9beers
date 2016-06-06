class AddImageToCustomBeers < ActiveRecord::Migration
  def change
    add_column :custom_beers, :image, :string
  end
end
