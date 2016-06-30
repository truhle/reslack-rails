class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.boolean :present
      t.string :icon
      t.integer :current_channel_id

      t.timestamps
    end
  end
end
