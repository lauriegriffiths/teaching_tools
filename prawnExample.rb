require 'prawn'
require 'prawn/table'

Prawn::Document.generate("hello.pdf") do
  text "Title", :align => :center, :size => 18
  move_down 12
  column_box([0, cursor], :columns => 2, :width => bounds.width, height: 300) do
    text "hello this is <b>some</b> long text that doesn't seem to render " *10 ,
          :inline_format => true,
          size: 14
  end

  table([ ["<b>hear</b>", "<b>say</b>"],
        ["short", "short"],
        ["loooooo", "short"] ],width:540,
        :cell_style => {padding: 20, size:20, align: :center, inline_format: true})


  table([ ["short", "short", "loooooo"],
        ["short", "looooooo", "short"],
        ["loooooo", "short", "short"] ],width:540,
        :cell_style => {padding: 20, size:20, align: :center})

  table([ ["Word", "definition"],
          ["Interesting stuff", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "definition"],
          ["Word", "looooooo"],
          ["loooooo", "short"] ],width:540,
        :column_widths => {0 => 150},
        :cell_style => {padding: 20, size:14, align: :center})


  #foo.each_slice(3).to_a
  #=> [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]
 

  
  move_down 10

  10.times do 
    text "Word - example sentence definition.  This sort of stuff"
  end
end
