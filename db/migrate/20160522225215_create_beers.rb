class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :abv
      t.integer :ibu
      t.text :description

      t.timestamps null: true
    end
  end
end
