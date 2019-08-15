class RemoveTypeFromBeers < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :type, :string
  end
end
