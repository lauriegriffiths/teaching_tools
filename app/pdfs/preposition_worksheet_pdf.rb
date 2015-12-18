class PrepositionWorksheetPdf < Prawn::Document
  def initialize(worksheet)
    super()
    text worksheet.title, align: :center, size: 20
    move_down 12
    text worksheet.body_with_multiple_choice, size: 14, inline_format: true
  end
end
