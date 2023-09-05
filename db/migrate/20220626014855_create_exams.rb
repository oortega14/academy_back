class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.boolean :approved, default: false
      t.integer :right_answers, default: 0
      t.references :user, foreign_key: true, null: false
      t.references :course_test, foreign_key: true, null: false
      t.timestamps
    end
  end
end
