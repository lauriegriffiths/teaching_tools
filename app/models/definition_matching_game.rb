class DefinitionMatchingGame < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :words
  accepts_nested_attributes_for :words

  def link_to_words
    words_in_body = Word.where(headword: vocab_list.split.uniq)
    self.words = words_in_body
  end

  def word_definition_pairs
    self.words.map do |w|
      [w.headword,w.no_headword_definition]
    end
  end
end
