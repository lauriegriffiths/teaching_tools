class CreateVerbMatchingGames < ActiveRecord::Migration
  def change
    create_table :verb_matching_games do |t|
      t.text :verbs
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
