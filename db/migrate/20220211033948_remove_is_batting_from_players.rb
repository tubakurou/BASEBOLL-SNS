class RemoveIsBattingFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :batting, :boolean
  end
end
