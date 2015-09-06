class AddWatchedToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :watched, :integer, :default => 0
  end
end
