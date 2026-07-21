class CreateDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :details do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity
      t.string :notes
      t.decimal :price

      t.timestamps
    end
  end
end
