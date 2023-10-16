class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :body
      t.integer :category, default: 0, null: false

      t.timestamps
    end
  end
end
