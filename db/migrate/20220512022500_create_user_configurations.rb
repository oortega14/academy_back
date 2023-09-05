class CreateUserConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_configurations do |t|
      t.boolean :public_profile, default: false
      t.boolean :promotions_email, default: false
      t.boolean :instructors_emails, default: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
