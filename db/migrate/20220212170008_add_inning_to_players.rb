class AddInningToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :inning, :integer
  end
end
