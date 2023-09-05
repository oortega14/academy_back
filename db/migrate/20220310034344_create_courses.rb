class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :price
      t.string :description
      t.integer :stars, default: 0
      t.references :teacher, foreign_key: { to_table: :users }
      t.references :academy, foreign_key: true, null: false
      t.timestamps
    end
  end
end

# hacer un buscador de usuarios
