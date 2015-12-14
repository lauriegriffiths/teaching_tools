class ArticleWorksheetsController < ApplicationController
  def new
    @article_worksheet = ArticleWorksheet.new
  end

  def create
    @article_worksheet = ArticleWorksheet.new(article_worksheet_params)
    if @article_worksheet.save
      redirect_to @article_worksheet
    else
      render 'new'
    end 
  end

  def show
    @article_worksheet = ArticleWorksheet.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ArticleWorksheetPdf.new(@article_worksheet)
        send_data pdf.render,
                  filename: "article_worksheet#{@article_worksheet.id}.pdf",
                  type: 'application/pdf'
      end
    end
  end

  def update
    @article_worksheet = ArticleWorksheet.find(params[:id])
    @article_worksheet.update_attributes(article_worksheet_params)
    redirect_to @article_worksheet
  end

  def edit 
    @article_worksheet = ArticleWorksheet.find(params[:id])
  end

  private
  def article_worksheet_params
    params.require(:article_worksheet).permit(:title, :body)
  end
end

