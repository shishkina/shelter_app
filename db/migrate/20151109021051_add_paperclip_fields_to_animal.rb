class AddPaperclipFieldsToAnimal < ActiveRecord::Migration
  def change
add_column :animals, :image_file_name,    :string
add_column :animals, :image_content_type, :string
add_column :animals, :image_file_size,    :integer
add_column :animals, :image_updated_at,   :datetime
  end
end
