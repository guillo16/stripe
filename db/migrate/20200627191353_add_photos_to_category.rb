class AddPhotosToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :photo_secondary, :string
  end
end
