class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :displayname
      t.string :email
      t.string :company
      t.boolean :admin
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email
  end
end
