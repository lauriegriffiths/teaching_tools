require 'prawn'

Prawn::Document.generate("hello.pdf") do
  text "Title", :align => :center, :size => 18
  move_down 12
  column_box([0, cursor], :columns => 2, :width => bounds.width, height: 300) do
    text "hello this is <b>some</b> long text that doesn't seem to render " *10 ,
          :inline_format => true,
          size: 14
  end

  10.times do 
    text "Word - example sentence definition.  This sort of stuff"
  end
end
