class CreateSponsors < ActiveRecord::Migration[8.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
