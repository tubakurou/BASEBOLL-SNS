class CreatePlayerInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :player_innings do |t|
     t.references :inning, foreign_key: true, null: false
     t.references :player_result, foreign_key: true, null: false

      t.timestamps
    end
  end
end
