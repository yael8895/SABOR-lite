class CreateIngredients < ActiveRecord::Migration[8.1]
  def change
    create_table :ingredients do |t|
      t.references :sponsor, null: false, foreign_key: true
      t.string :name
      t.decimal :unit_price
      t.string :image

      t.timestamps
    end
  end
end
