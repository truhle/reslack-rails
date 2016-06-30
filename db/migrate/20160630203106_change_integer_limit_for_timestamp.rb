class ChangeIntegerLimitForTimestamp < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :timestamp, :integer
    add_column :messages, :timestamp, :integer, limit: 8
  end
end
