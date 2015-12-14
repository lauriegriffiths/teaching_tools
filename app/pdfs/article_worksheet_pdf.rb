class ArticleWorksheetPdf < Prawn::Document
  def initialize(worksheet)
    super()
    text worksheet.title, align: :center, size: 20
    move_down 12
    text worksheet.body_with_no_articles, size: 14
  end
end
