require 'spec_helper'

describe "gists/new.html.erb" do


  it "check display header correct" do
    visit new_gist_path
    expect(page).to have_content("Snippet")
  end

  it "check display language form" do
    visit new_gist_path
    expect(page).to have_content("Lang")
  end

  it "check display description form" do
    visit new_gist_path
    expect(page).to have_content("Description")
  end


end