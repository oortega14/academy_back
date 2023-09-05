class CreateAcademies < ActiveRecord::Migration[7.0]
  def change
    create_table :academies do |t|
      t.string :name
      t.string :description
      t.string :slogan
      t.references :academy_category, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
