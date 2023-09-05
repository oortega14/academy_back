class CreateTestQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :test_questions do |t|
      t.string :question
      t.references :course_test, foreign_key: true, null: false
      t.timestamps
    end
  end
end
