class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.string :expires_at

      t.timestamps
    end
  end
end
