class VerbMatchingGame < ActiveRecord::Base
  belongs_to :user


  def triplets
    verbs.split.map{|w| word_triplet(w)}
  end

  private
  def word_triplet(word)
    [word,word.en.past_tense,word.en.past_participle]
  end
end
