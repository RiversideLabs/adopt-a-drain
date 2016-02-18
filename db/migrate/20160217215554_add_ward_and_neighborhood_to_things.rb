class AddWardAndNeighborhoodToThings < ActiveRecord::Migration
  def change
    add_column :things, :ward, :string
    add_column :things, :neighborhood, :string
  end
end
