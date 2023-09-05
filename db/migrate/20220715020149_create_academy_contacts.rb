class CreateAcademyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :academy_contacts do |t|
      t.string :name
      t.string :email
      t.string :message
      t.references :academy, foreign_key: true, null: false
      t.timestamps
    end
  end
end
