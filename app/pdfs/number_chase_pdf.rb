class NumberChasePdf < Prawn::Document
  def initialize(game)
    super()
    game.number_pairs.each do |player|
      table_data = [["<b>hear</b>","<b>say</b>"]] + player
      table(table_data,width:540, :row_colors => ["E0E0E0", "FFFFFF"],
            :cell_style => {padding: 10, size:14, align: :center, inline_format: true})
      move_down 20
    end
  end
end
