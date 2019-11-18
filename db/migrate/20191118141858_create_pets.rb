class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :price_per_day
      t.text :description
      t.string :species
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
