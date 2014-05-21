require 'spec_helper'

describe "GistsIntegrations" do
  describe "GET /gists_integrations" do
    it "works! (now write some real specs)" do
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

    fill_in "Snippet", :with => "sth"
    find("#gist_lang").select("css")
    fill_in "Description", :with => "Some description"
    click_button "Create Gist"


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

  it "check displayed buttons after visit #show without login" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit gist_path('1')
    expect(page).should have_css("a.btn", :text => 'Back')
    expect(page).should have_no_content('Edit')
    expect(page).should have_no_content('Delete')
  end

  it "check displayed snippet in <pre> tag" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit gist_path('1')
    expect(page).should have_selector("pre>span.nt")#, :text => @gist.snippet)
    expect(page).should have_content(@gist.snippet)
  end

  it "check header in #edit page" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit edit_gist_path('1')
    page.should have_selector("h1", text: "Edit Gist")
  end

  it "check if pagination is displayed at #index page" do
    20.times do @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something") end
    visit gists_path
    page.should have_selector 'div.pagination'
  end

  it "check textarea with data to edit in #edit" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit edit_gist_path('1')
    page.should have_selector("textarea", :text => @gist.snippet)
  end

  it "check header in #new page" do
    visit new_gist_path
    page.should have_selector("h1", text: "New Gist")
  end

  it "check #new page have textarea, select and input" do
    visit new_gist_path
    page.should have_selector("input")
    page.should have_selector("textarea")
    page.should have_selector("select")
  end


  it "check #index page display button show correct" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit root_path
    page.should have_selector 'a.btn', :text => 'Show'

  end

  it "chceck if #index page display pagination correct" do
    20.times do @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something") end
    visit gists_path
    page.has_selector? 'div.container-fluid', :count => 10
  end

  it "check if select search displays correct" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    @gist2 = Gist.create(snippet: "The title", lang: "c", description: "Desc something")
    visit root_path
    page.should have_selector 'option', :count => 2
  end
  #. dodaje 2 te same jezyki, klika search i sprawdza czy content zawiera 2 rekordy
  it "check if search work correct" do
    2.times do @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something") end
    pending("tu coś nie wchodzi, wtf?")
    click_link 'Search'
    page.has_content? ''
  end


  #. zabronić dodawania gistow bez snippeta i bez description (not by empty)
  it "check adding gist with empty snippet" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit edit_gist_path(@gist)
    fill_in "Snippet", :with => ""
    click_button 'Update Gist'
    current_path.should_not == root_path
  end

  it "check adding gist with empty description" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
    visit edit_gist_path(@gist)
    fill_in "Description", :with => ""
    click_button 'Update Gist'
    current_path.should_not == root_path
  end

=begin
  describe "Correct working after logged in" do
    before :each do
      OmniAuth.config.mock_auth[:github]

      visit root_path
      click_link 'Sign in with GitHub'
    end

    it "check delete action at #index page" do
      @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
      visit root_path
      page.should have_content(@gist.snippet)
      click_link 'Delete'
      page.should have_no_content(@gist.snippet)
    end

  end
=end
end


