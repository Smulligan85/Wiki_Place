require "rails_helper"

RSpec.feature "Users can delete wikis" do
  
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    login_as(user)
    FactoryGirl.create(:wiki, title: "Test Wiki", user: user)

    visit "/"
    click_link "Test Wiki"
    click_link "Destroy Wiki"

    expect(page).to have_content "Wiki no more..."
    expect(page.current_url).to eq wikis_url
    expect(page).to have_no_content "Test Wiki"
  end
end