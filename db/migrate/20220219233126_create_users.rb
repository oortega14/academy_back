class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :dni
      t.string :college_degree
      t.string :description
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
