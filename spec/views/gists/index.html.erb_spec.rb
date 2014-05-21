require 'spec_helper'

describe "gists/index.html.erb" do

  it "check display autor" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something", autor: "test")
    visit root_path
    expect(page).to have_content("autor")
  end


end