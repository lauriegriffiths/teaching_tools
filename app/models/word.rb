class Word < ActiveRecord::Base
  belongs_to :type
  has_and_belongs_to_many :vocab_worksheets 
  has_and_belongs_to_many :definition_matching_games
end
