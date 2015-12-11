class VocabWorksheetsController < ApplicationController
  def new
    @vocab_worksheet = VocabWorksheet.new
  end

  def create
    @vocab_worksheet = VocabWorksheet.create(vocab_worksheet_params)
    @vocab_worksheet.link_to_words
    render 'edit' 
  end

  def update
    @vocab_worksheet = VocabWorksheet.find(params[:id])
    @vocab_worksheet.update_attributes(vocab_worksheet_params)
    @vocab_worksheet.link_to_words
    render 'edit'
  end

  def show
    @vocab_worksheet = VocabWorksheet.find(params[:id])
  end

  def show
    @vocab_worksheet = VocabWorksheet.find(params[:id])
  end

  private
  def vocab_worksheet_params
    params.require(:vocab_worksheet).permit(:title, :body)
  end
end
