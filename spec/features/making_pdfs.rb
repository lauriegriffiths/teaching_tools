
feature "make some pdfs" do
  scenario "make a flashcard game" do
    visit "/"
    click_link "Verb Matching Game"
    fill_in "Title", with: 'Test Game'
    fill_in "Verbs", with: "run play walk"
    click_button "Create" 
    expect(page).to have_content 'run'
    expect(page).to have_content 'ran'
    expect(page).to have_content 'played'
    click_on "Download"
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  scenario "make an articles worksheet" do
    visit "/"
    click_link "Definite/indefinite Articles"
    fill_in "Title", with: 'Test worksheet'
    fill_in "Body", with: "The woman got on a bus and spoke to the bus driver."
    click_button "Create" 
    expect(page).to have_content '_____ woman got on _____ bus and spoke to _____ bus driver.'
    click_on "Download"
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end


end
