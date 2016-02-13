class Word < ActiveRecord::Base
  belongs_to :type
  has_and_belongs_to_many :vocab_worksheets 
  has_and_belongs_to_many :definition_matching_games

  def no_headword_definition
    self.definition.gsub(/'''[\-a-zA-Z0-9']+'''/,"___________")
  end

  def clean_definition
    self.definition.gsub(/''+([\-a-zA-Z]+)''+/,"\\1")
  end
end
