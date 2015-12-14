class VerbMatchingGamePdf < Prawn::Document
  def initialize(game)
    super()
    text game.title, align: :center, size: 20
    define_grid(:columns => 3, :rows => game.triplets.length, :gutter => 0)

    game.triplets.each_with_index do |triplet,i|
      triplet.each_with_index do |word,j|
        grid(i,j).bounding_box do
          stroke_bounds
          text word, size: 20, align: :center, valign: :center
        end
      end
    end
  end
end
