class CreateActiveSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :active_sessions do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
