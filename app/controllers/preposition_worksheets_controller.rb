class PrepositionWorksheetsController < ApplicationController
  def new
    @preposition_worksheet = PrepositionWorksheet.new
  end

  def create
    @preposition_worksheet = PrepositionWorksheet.new(preposition_worksheet_params)
    if @preposition_worksheet.save
      redirect_to @preposition_worksheet
    else
      render 'new'
    end 
  end

  def show
    @preposition_worksheet = PrepositionWorksheet.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PrepositionWorksheetPdf.new(@preposition_worksheet)
        send_data pdf.render,
                  filename: "preposition_worksheet#{@preposition_worksheet.id}.pdf",
                  type: 'application/pdf'
      end
    end
  end

  def update
    @preposition_worksheet = PrepositionWorksheet.find(params[:id])
    @preposition_worksheet.update_attributes(preposition_worksheet_params)
    redirect_to @preposition_worksheet
  end

  def edit 
    @preposition_worksheet = PrepositionWorksheet.find(params[:id])
  end

  private
  def preposition_worksheet_params
    params.require(:preposition_worksheet).permit(:title, :body)
  end

end
