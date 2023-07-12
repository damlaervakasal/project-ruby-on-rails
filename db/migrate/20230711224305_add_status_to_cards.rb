class AddStatusToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :status, :integer, default: 0
  end
end
