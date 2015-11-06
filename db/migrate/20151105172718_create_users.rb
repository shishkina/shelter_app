class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :phone, :limit => 20, default: 0
      t.string :email, null: false
      t.string :password, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
