class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.boolean :visible, default: false
      t.references :course, foreign_key: true, null: false
      t.timestamps
    end
  end
end
# agregar vídeo
# agregar archivos adicionales
# agregar certificado
