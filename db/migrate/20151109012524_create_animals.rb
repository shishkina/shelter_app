class CreateAnimals < ActiveRecord::Migration

  def change
    create_table :animals do |t|
      t.string :animal_name
      t.string :kind
      t.integer :age
      t.text :story
      t.string :status, default: "pending"

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
