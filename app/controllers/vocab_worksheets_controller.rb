class VocabWorksheetsController < ApplicationController
  def new
    @vocab_worksheet = VocabWorksheet.new
  end

  def create
    @vocab_worksheet = VocabWorksheet.new(vocab_worksheet_params)
    @vocab_worksheet.link_to_words
    if @vocab_worksheet.save
      redirect_to @vocab_worksheet
    else
      render 'new'
  end

  def update
    @vocab_worksheet = VocabWorksheet.find(params[:id])
    @vocab_worksheet.update_attributes(vocab_worksheet_params)
    @vocab_worksheet.link_to_words
    redirect_to @vocab_worksheet
  end

  def edit 
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
