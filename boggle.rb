class Boggle

  def initialize
    @word_list = ["art", "bet", "cat", "catch", "her", "ruby", "hyfn"]
  end

  def check_word(string)
    result = ""
    @word_list.each do |word|
      if word == string
        return true
      end
    end
  end

end