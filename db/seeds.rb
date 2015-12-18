# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

LONGMAN_REGEX = /^([^,]+).+/
require 'set'
longman_words = Set.new
f = File.new("db/longman3000.txt")
f.each_line do |l|
  word = l.gsub(LONGMAN_REGEX,'\1').chomp
  longman_words.add(word)
end


WIKI_REGEX = /<doc>\n<title>Wikipedia: (.*?)<\/title>\n<url>(.*?)<\/url>\n<abstract>(.*?)<\/abstract>.*?<\/doc>/m

PAGE_CONTENT_REGEX = /<page>\s*<title>(.+?)<\/title>.*?<text.*?>(.*?)<\/text>/m

POS_REGEX = /==\s*([\w ]+)\s*==\n(.*?)(?=\z|==)/m

REMOVAL_REGEX = /\[\[[\w-]+:\w+\]\]|{{\w+}}\n/

DEFINITIONS_REGEX =/#\s*(.+)\n((?:#:\s*.+(?:\n|\z))*)/

DEFINITION_CLEANUP = /\{\{[\w\| ]+\}\}\s*/

REMOVE_LINKS = /\[\[(?:[\w\s]+\|)?([\w\s]+)\]\]/

EXAMPLE_CLEANUP = /''(.*)''/

REMOVE_LINE_BEGINNINGS = /#:\s*/

f = File.new("db/simplewiktionary.xml",'r:utf-8')

content = f.read

ActiveRecord::Base.transaction do
  content.scan(PAGE_CONTENT_REGEX) do |headword,content| 
    content.scan(POS_REGEX) do |pos,pos_content|
      pos_content.sub(REMOVAL_REGEX,'')
      definitions = pos_content.scan(DEFINITIONS_REGEX)
      definitions.each do |d|
        definition = d[0]
        examples = d[1]
        part_of_speech = Type.find_or_create_by(pos:pos.downcase)
        Word.create(headword:headword,
                          type:part_of_speech,
                          definition:definition.gsub(DEFINITION_CLEANUP,'').gsub(REMOVE_LINKS,'\1'))
          #examples:examples.gsub(EXAMPLE_CLEANUP,'\1').gsub(REMOVE_LINE_BEGINNINGS,'').gsub(REMOVE_LINKS,'\1'))
      end
    end
  end
end

f.close()


ActiveRecord::Base.transaction do
  File.open("db/frequency5000.txt") do |f|
    f.each_line do |l|
      word, pos, frequency = l.split 
      Word.where(headword:word).find_each do |w|
        w.frequency = frequency
        w.save
      end
    end
  end
end



#ActiveRecord::Base.transaction do
#  File.open("db/frequency.txt") do |f|
#    f.each_line do |l|
#      word, frequency = l.split
#      Word.where(headword:word).find_each do |w|
#        w.frequency = frequency
#        w.save
#      end
#    end
#  end
#end

