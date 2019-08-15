class AddBeerTypeToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :beer_type, :string
  end
end
