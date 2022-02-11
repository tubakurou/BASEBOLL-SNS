class AddRunStatusToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :run_status, :integer, default: 0, null: false
  end
end
