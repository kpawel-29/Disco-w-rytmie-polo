require 'spec_helper'

describe "GistsIntegrations" do
  describe "GET /gists_integrations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  it "index page should have title in h1 selector" do
    visit root_path
    page.should have_selector("h1", text: "Gists")
  end

  it "should have navbar on all pages" do
    visit root_path
    expect(page).to have_css "div.navbar"
    visit gists_search_path
    expect(page).to have_css "div.navbar"
    visit new_gist_path
    expect(page).to have_css "div.navbar"
  end


end

feature "Gist management" do
  scenario "User creates a new gist" do
    visit "/gists/new"

    fill_in "Snippet", :with => ""
    find("#gist_lang").select("css")
    fill_in "Description", :with => "Some description"
    click_button "Create Gist"

    current_path.should == gist_path('1')
    expect(page).to have_text("Gist was successfully created.")

  end

  scenario "User update a gist" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit edit_gist_path('1')

    fill_in "Snippet", :with => "Coś"
    find("#gist_lang").select("css")
    fill_in "Description", :with => "Some description"
    click_button "Update Gist"

    current_path.should == gist_path('1')
    expect(page).to have_text("Gist was successfully updated.")

  end
end
