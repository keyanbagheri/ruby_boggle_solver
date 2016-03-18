require 'spec_helper'

describe Boggle do

  before :each do
    @boggle = Boggle.new
  end

  describe "#new boggle" do
    it "returns a Boggle object" do
      expect(@boggle).to be_an_instance_of Boggle
    end
  end

  describe ".check_word" do
    context "when given cat" do
      it "returns true for cat" do
        expect(@boggle.check_word("cat")).to eq(true)
      end
    end
    context "when given non-word" do
      it "does not return true for asdf" do
        expect(@boggle.check_word('asdf')).not_to eq(false)
      end
    end
  end

end