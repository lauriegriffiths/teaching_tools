require 'rails_helper'

RSpec.describe VerbMatchingGame, type: :model do
  it "generates irregular verbs correctly" do
    game = create(:verb_matching_game,verbs: "run drink")
    expect(game.triplets[0]).to eq(["run","ran","run"])
    expect(game.triplets[1]).to eq(["drink","drank","drunk"])
  end
end
