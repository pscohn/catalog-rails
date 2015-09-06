class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :number
      t.integer :num_episodes
      t.references :show, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
