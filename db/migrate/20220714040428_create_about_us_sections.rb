class CreateAboutUsSections < ActiveRecord::Migration[7.0]
  def change
    create_table :about_us_sections do |t|
      t.string :title
      t.string :description
      t.references :academy, foreign_key: true, null: false
      t.timestamps
    end
  end
end
