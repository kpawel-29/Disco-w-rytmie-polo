require 'spec_helper'

describe SessionsController do
  describe "GET 'failure'" do
    it "returns http success" do
      get 'failure'
      response.should be_success
    end
  end
end
