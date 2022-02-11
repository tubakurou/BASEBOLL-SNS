class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_image_id
      t.string :team_name, null: false

      t.timestamps
    end
  end
end
