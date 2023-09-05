class CreateQuestionOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :question_options do |t|
      t.string :option_text
      t.boolean :right_answer, default: false
      t.references :test_question, foreign_key: true, null: false
      t.timestamps
    end
  end
end
