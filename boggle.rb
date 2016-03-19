class Boggle

  def initialize
    # seed a small list of words to check from
    @word_list = ["art", "bet", "cat", "catch", "catcher", "her", "ruby", "hyfn"]
    # seed a default board to check
    @board = [
              ['b', 'e', 't', 'x'],
              ['e', 'r', 'c', 'a'],
              ['r', 'c', 't', 'q'],
              ['e', 'h', 's', 'i']
             ]
  end

  # in order to save time on our more complex methods we will run a couple simple methods to shorten our word list to only definite possibilities

  #checking if the board even has the character included in our word above

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

  # before running a detailed check of a word we will first see if all of it's characters even appear on the board

  def check_word_possibility(word)
    word.split('').each do |char|
      status = check_board_for_char(char)
      if status == []
        return false
      end
    end
    return true
  end

  def shorten_word_list
    new_list = []
    @word_list.each do |word|
      if check_word_possibility(word) == true
        new_list << word
      end
    end
    return new_list
  end

  def check_board_for_words

  end


  # def check_words
  #   @word_list.each do |word|
  #     check_word(word)
  #   end
  # end

  # def check_neigbors(index1, index2, char)

  # end

end