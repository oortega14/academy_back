class CreateCourseTests < ActiveRecord::Migration[7.0]
  def change
    create_table :course_tests do |t|
      t.integer :time_limit
      t.integer :approve_with, default: 0
      t.references :course, foreign_key: true, null:false
      t.timestamps
    end
  end
end
