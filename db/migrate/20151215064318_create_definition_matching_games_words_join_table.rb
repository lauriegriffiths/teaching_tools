class CreateDefinitionMatchingGamesWordsJoinTable < ActiveRecord::Migration
  def change
    create_table :definition_matching_games_words, id: false do |t|
      t.integer :definition_matching_game_id
      t.integer :word_id
    end
  end
end
