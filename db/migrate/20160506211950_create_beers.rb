class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.decimal :abv, precision: 3, scale: 1
      t.integer :ibu
      t.boolean :tap

      t.timestamps null: true
    end
  end
end
