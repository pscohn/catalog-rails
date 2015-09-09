class AddSearchKeywords < ActiveRecord::Migration
  def change
    add_column :shows, :keywords, :string
  end
end
