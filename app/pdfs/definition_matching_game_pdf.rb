class DefinitionMatchingGamePdf < Prawn::Document
  def initialize(game)
    super()
    table(game.word_definition_pairs,width:540,
        :column_widths => {0 => 150},
        :cell_style => {padding: 20, size:14, align: :center})
  end
end
