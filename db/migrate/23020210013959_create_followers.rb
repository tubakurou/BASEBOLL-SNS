class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :follower, foreign_key: true, null: false
      t.references :followerd, foreign_key: true, null: false

      t.timestamps
    end
  end
end
