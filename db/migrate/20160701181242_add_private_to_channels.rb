class AddPrivateToChannels < ActiveRecord::Migration[5.0]
  def change
    add_column :channels, :private, :boolean
  end
end
