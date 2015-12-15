require 'rails_helper'

RSpec.describe ArticleWorksheet, type: :model do
  it "removes articles correctly" do
    worksheet = create(:article_worksheet, body:"A woman got on a bus.")
    expect(worksheet.body_with_no_articles).to eq "_____ woman got on _____ bus."
  end
end
