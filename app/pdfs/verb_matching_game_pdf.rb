class VerbMatchingGamePdf < Prawn::Document
  def initialize(game)
    super()
    table(game.triplets,width:540,
    :cell_style => {padding: 30, size:20, align: :center})
  end
end
