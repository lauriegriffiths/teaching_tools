class CreateDefinitionMatchingGames < ActiveRecord::Migration[4.2]
  def change
    create_table :definition_matching_games do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :vocab_list

      t.timestamps null: false
    end
  end
end
