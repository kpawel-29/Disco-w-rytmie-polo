require 'spec_helper'

describe Gist do
  describe "#new Gist-no params" do
    it "takes no parameters and returns a Gist object" do
      @gist = Gist.new
      @gist.should be_an_instance_of Gist
    end
  end


end
