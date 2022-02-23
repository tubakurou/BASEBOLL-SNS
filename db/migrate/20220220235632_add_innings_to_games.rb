class AddInningsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :innings, :integer,default: 0, null: false
  end
end
