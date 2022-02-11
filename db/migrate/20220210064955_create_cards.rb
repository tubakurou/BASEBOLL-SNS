class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :team, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false
      t.boolean :after_status, default: false, null: false
      t.boolean :attack_status, default: false, null: false
      t.timestamps
    end
  end
end
