class RemoveImageFromCustomBeers < ActiveRecord::Migration
  def change
    remove_column :custom_beers, :image, :string
  end
end
