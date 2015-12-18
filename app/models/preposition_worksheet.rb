class PrepositionWorksheet < ActiveRecord::Base
  belongs_to :user
  
  def body_with_multiple_choice
    prepositions = "on in at for to by".split
    body.split.map do |word|
      if prepositions.include?(word) 
        "<b>"+(prepositions - [word]).shuffle.take(2).append(word).shuffle.join("/")+"</b>"
      else
        word
      end
    end.join " "
  end

end
