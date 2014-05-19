require 'spec_helper'

describe "gists/show.html.erb" do

  it "check display autor" do
    @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something", autor: "test")
    visit gist_path('1')
    expect(page).to have_content("autor")
  end


end