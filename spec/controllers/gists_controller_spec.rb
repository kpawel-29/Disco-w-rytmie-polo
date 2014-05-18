require 'spec_helper'

describe GistsController do
  describe "GET #index" do
    it "responds successfully index page" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "load all of the gists into @gists" do
      gist1, gist2 = Gist.create!, Gist.create!
      get :index
      expect(assigns(:gists)).to match_array([gist1, gist2])
    end

end

  describe "GET #new" do
    it "responds successfully new gist page" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

  end

  describe "GET #edit" do
    it "responds successfully edit page" do
      @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
      visit edit_gist_path(@gist)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the edit template" do
      @gist = Gist.create(snippet: "The title", lang: "css", description: "Desc something")
      visit edit_gist_path(@gist)
      expect(response).to render_template("edit")
    end
#. sprawdzic czy jest zabronione update na puste description lub snippet - 2 oddzielne testy
    it "check editing field description to empty" do
      pending("something else getting finished")
    end

    it "check editing field snippet to empty" do
      pending("something else getting finished")
    end
  end

  describe "GET #search" do
    it "responds successfully search page" do
      get :search
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the search tepmlate" do
      get :search
      expect(response).to render_template("search")
    end

  end


end
