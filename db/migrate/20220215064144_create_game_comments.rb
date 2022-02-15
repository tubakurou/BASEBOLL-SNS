class CreateGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table :game_comments do |t|
      t.text :game_content
      t.references :game, foreign_key: true, null: false
      t.references :comment, foreign_key: true, null: false

      t.timestamps
    end
  end
end
