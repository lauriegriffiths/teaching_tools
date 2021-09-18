class CreateVocabWorksheetsWordsJoinTable < ActiveRecord::Migration[4.2]
  def change
    create_table :vocab_worksheets_words, id: false do |t|
      t.integer :vocab_worksheet_id
      t.integer :word_id
    end
  end
end

