class AddTitleToVerbMatchingGame < ActiveRecord::Migration[4.2]
  def change
    add_column :verb_matching_games, :title, :string
  end
end
