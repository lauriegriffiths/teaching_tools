class VocabWorksheet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :words

  def link_to_words
    words_in_body = Word.where(headword: body.split.uniq)
    self.words = words_in_body
  end
end
