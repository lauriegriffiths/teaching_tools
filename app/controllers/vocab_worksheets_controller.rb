class VocabWorksheetsController < ApplicationController
  def new
    @vocab_worksheet = VocabWorksheet.new
  end
end
