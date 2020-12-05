class AddPriceToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :price, :integer
  end
end
