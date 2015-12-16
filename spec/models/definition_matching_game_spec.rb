require 'rails_helper'

RSpec.describe DefinitionMatchingGame, type: :model do
  it "generates irregular verbs correctly" do
    create(:word,headword:"dog",definition:"a four-legged furry animal")
    game = create(:definition_matching_game,vocab_list: "dog")
    game.link_to_words
    expect(game.words.first.definition).to eq("a four-legged furry animal")
  end
end
