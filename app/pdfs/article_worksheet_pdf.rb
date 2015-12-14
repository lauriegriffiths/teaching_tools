class ArticleWorksheetPdf < Prawn::Document
  def initialize(worksheet)
    super()
    text worksheet.title, align: :center, size: 18
    move_down 12
    text worksheet.body_with_no_articles
  end
end
