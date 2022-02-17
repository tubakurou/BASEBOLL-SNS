class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :game_comment, foreign_key: true, null: false

      t.timestamps
       t.index [:user_id, :game_comment_id], unique: true
    end
  end
end
