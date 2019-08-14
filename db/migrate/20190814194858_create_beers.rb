class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :description
      t.string :brewery
      t.integer :rating
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
