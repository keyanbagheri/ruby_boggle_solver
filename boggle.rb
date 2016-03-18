class Boggle

  def initialize
    # seed a small list of words to check from
    @word_list = ["art", "bet", "cat", "catch", "her", "ruby", "hyfn"]
    # seed a default board to check
    @board = [
              ['b', 'e', 't', 'x'],
              ['a', 'r', 'c', 'a'],
              ['r', 'c', 't', 'x'],
              ['e', 'h', 's', 'i']
             ]
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