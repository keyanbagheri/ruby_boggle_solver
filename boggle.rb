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
    words_in_board = []
    new_list = shorten_word_list
    new_list.each do |word|
      puts word
      if check_board_for_string(word) == true
        words_in_board << word
      end
    end
    return words_in_board
  end

  def check_board_for_string(string)
    indices = check_board_for_char(string[0])
    string.slice!(0)
    indices.each do |index|
      if check_for_end_of_word(string, index[0], index[1]) == true
        return true
      end
    end
    return false
  end

  def check_for_end_of_word(string, y, x)
    indices = check_neighbors_for_char(string[0], y, x)
    if indices == []
      return false
    elsif string.length == 1
      return true
    elsif string.length > 1
      string.slice!(0)
      indices.each do |index|
        results = check_for_end_of_word(string, index[0], index[1])
        if results == true
          return true
        end
      end
    else
      return false
    end
  end

  def check_neighbors_for_char(char, y, x)
    indices = []
    i = -1
    until i == 2
      # make sure that the index falls in the range of the 4x4 board (0..3)
      if y+i >= 0 && y+i <= 3
        j = -1
        until j == 2
          # make sure that the index falls in the range of the 4x4 board (0..3)
          if x+j >=0 && x+j <=3
            # if the neighboring cells have a matching character, add their indices to the collection
            if @board[y + i][x + j] === char
              indices << [y + i, x + j]
            end
          end
          j += 1
        end
      end
      i += 1
    end
    #finally we return our collection of indices that house our specific character
    return indices
  end

end

@boggle = Boggle.new

print @boggle.check_neighbors_for_char('t', 1, 1)
