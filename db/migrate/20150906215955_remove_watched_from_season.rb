class RemoveWatchedFromSeason < ActiveRecord::Migration
  def change
    remove_column :seasons, :watched, :integer
    remove_column :seasons, :num_episodes, :integer
  end
end
