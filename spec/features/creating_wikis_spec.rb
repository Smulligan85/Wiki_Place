require 'rails_helper'

RSpec.feature "Users can create new wikis" do

  before do
    login_as(FactoryGirl.create(:user))
    visit "/"
    click_link "New Wiki"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Test Wiki"
    fill_in "Body", with: "Body of test wiki"
    click_button "Submit"

    expect(page).to have_content "Wiki was saved. Huzzah!"
  end

  scenario "when providing invalid attributes" do
    click_button "Submit"

    expect(page).to have_content "There was an error saving the wiki. Please try again."
    expect(page).to have_content "Title can't be blank"    
    expect(page).to have_content "Body can't be blank"
  end

end