class WordsController < ApplicationController
  def find_words
    @candidate_words = Word.where(headword: params[:body].split.uniq)
    respond_to do |format|
      format.js
    end
  end
end
