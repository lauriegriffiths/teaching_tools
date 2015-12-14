class AddTitleToVerbMatchingGame < ActiveRecord::Migration
  def change
    add_column :verb_matching_games, :title, :string
  end
end
