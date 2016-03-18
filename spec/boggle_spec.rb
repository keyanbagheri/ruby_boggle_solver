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

  describe ".check_board_for_char" do
    context "when given x" do
      it "returns array with one index pair (0,3)" do
        expect(@boggle.check_board_for_char("x")).to eq([[0,3]])
      end
    end
    context "when given c" do
      it "returns array with two index pair (1,2) and (2,1)" do
        expect(@boggle.check_board_for_char("c")).to eq([[1, 2], [2, 1]])
      end
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