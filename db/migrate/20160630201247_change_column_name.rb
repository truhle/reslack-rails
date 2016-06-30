class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :channels, :type, :channel_type
  end
end
