require "rails_helper"

RSpec.feature "Users can edit an existing wiki" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:wiki) { FactoryGirl.create(:wiki, title: "Original Wiki") }

  before do
    login_as(user)
    visit "/"
    click_link "Original Wiki"
    click_link "Edit Wiki"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Edited Wiki"
    click_button "Submit"

    expect(page).to have_content "Wiki updated."
    expect(page).to have_content "Edited Wiki"
  end

end