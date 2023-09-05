class CreateExamAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_answers do |t|
      t.boolean :right, default: false
      t.references :exam, foreign_key: true, null: false
      t.references :test_question, foreign_key: true, null: false
      t.references :question_option, foreign_key: true, null: true
      t.timestamps
    end
  end
end
