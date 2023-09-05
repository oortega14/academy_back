class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :user, foreign_key: true, null: false
      t.references :course, foreign_key: true, null: false
      t.timestamps
    end
  end
end
