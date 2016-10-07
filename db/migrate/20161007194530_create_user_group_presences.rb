class CreateUserGroupPresences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_group_presences do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :presence
    end
  end
end
