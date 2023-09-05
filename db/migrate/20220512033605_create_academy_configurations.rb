class CreateAcademyConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :academy_configurations do |t|
      t.string :domain
      t.json :colors
      t.references :academy, foreign_key: true, null: false
      t.timestamps
    end
  end
end
