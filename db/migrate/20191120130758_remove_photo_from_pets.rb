class RemovePhotoFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :photo, :string
  end
end
