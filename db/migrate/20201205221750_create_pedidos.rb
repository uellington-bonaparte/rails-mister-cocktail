class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.string :mesa
      t.integer :quantidade
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
