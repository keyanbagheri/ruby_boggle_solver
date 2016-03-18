class Boggle

  def initialize
    # seed a small list of words to check from
    @word_list = ["art", "bet", "cat", "catch", "her", "ruby", "hyfn"]
    # seed a default board to check
    @board = [
              ['b', 'e', 't', 'x'],
              ['a', 'r', 'c', 'a'],
              ['r', 'c', 't', 'q'],
              ['e', 'h', 's', 'i']
             ]
  end

  def check_board_for_char(char)
    indices = []
    for y in 0..3
      for x in 0..3
        if @board[y][x] == char
          indices << [y, x]
        end
      end
    end
    return indices
  end

  def check_words
    @word_list.each do |word|
    end
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