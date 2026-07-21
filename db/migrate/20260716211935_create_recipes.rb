class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.integer :total_views
      t.integer :weekly_views
      t.integer :total_scores
      t.decimal :score

      t.timestamps
    end
  end
end
