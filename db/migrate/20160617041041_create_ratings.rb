class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :user_id
      t.string :beer_id
      t.string :rating

      t.timestamps null: true
    end
  end
end
