class CreateUserChannelStars < ActiveRecord::Migration[5.0]
  def change
    create_table :user_channel_stars do |t|
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
