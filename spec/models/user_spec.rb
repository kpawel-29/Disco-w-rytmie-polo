require 'spec_helper'

describe User do
  describe "#new User-no params" do
    it "takes no parameters and returns a User object" do
      @user = User.new
      @user.should be_an_instance_of User
    end
  end
end
