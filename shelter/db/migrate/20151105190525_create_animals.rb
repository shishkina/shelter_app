class CreateAnimals < ActiveRecord::Migration

  def change
    create_table :animals do |t|
      t.string :animal_name
      t.string :type
      t.integer :age
      t.text :story
      t.string :image_url
      t.boolean :status, default: nil
      
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
