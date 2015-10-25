require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:wiki) { FactoryGirl.create(:wiki, title: "New Awesome Wiki") }

  before do
    login_as(user)
  end

  scenario "with the project details" do
    visit "/"
    click_link "New Awesome Wiki"

    expect(page).to have_content "New Awesome Wiki"
    expect(page.current_url).to eq wiki_url(wiki)
  end
  
end
    