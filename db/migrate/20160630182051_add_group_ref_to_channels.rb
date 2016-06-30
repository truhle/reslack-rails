class AddGroupRefToChannels < ActiveRecord::Migration[5.0]
  def change
    add_reference :channels, :group, foreign_key: true
  end
end
