class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :usernames, array: true, default: []
      t.string :type
      t.string :created_by
      t.string :topic
      t.string :purpose

      t.timestamps
    end
  end
end
