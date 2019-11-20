class AddLocationToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :location, :string
  end
end
