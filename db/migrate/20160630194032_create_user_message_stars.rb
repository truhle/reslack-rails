class CreateUserMessageStars < ActiveRecord::Migration[5.0]
  def change
    create_table :user_message_stars do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
