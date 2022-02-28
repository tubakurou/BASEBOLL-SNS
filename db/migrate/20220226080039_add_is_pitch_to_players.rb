class AddIsPitchToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :is_pitch, :boolean, default: 0, null: false
  end
end
