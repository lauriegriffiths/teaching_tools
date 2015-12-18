class VocabWorksheet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :words

  def link_to_words
    lem = Lemmatizer.new
    words_in_body = Word.where(headword: body.split.map{|w| remove_punctuation(w)}.map{|w| lem.lemma(w)}.uniq)
    tuples = words_in_body.map{|w| [w,w.headword,w.frequency]}
    sorted_tuples = tuples.sort_by{|w,hw,f| f ? f:0}.take(8)
    self.words = sorted_tuples.map{|w,hw,f| w}
  end

  private
  def remove_punctuation(word)
    word.gsub(/[\.:;,]/,"")
  end

end
