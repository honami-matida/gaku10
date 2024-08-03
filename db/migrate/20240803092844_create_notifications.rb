class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :subject, polymorphic: true
      t.references :end_user, foreign_key: true
      t.string :action_type, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
