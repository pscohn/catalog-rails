class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.boolean :watched, :default => false

      t.timestamps null: false
    end
  end
end
