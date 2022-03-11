class RemoveGoodsFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :goods, :integer
  end
end
