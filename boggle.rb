class Boggle

  attr_accessor :word_list, :board

  def initialize
    # seed a small list of words to check from
    @word_list = ["art", "bet", "cat", "catch", "catcher", "her", "ruby", "hyfn"]
    # seed a default board to check
    @board = [
              [{char: 'b', searched: false}, {char: 'e', searched: false}, {char: 't', searched: false}, {char: 'x', searched: false}],
              [{char: 'e', searched: false}, {char: 'p', searched: false}, {char: 'c', searched: false}, {char: 'a', searched: false}],
              [{char: 'r', searched: false}, {char: 'c', searched: false}, {char: 't', searched: false}, {char: 'q', searched: false}],
              [{char: 'e', searched: false}, {char: 'h', searched: false}, {char: 's', searched: false}, {char: 'i', searched: false}]
             ]
    @used_indices = []
  end

  # in order to save time on our more complex methods we will run a couple simple methods to shorten our word list to only definite possibilities

  # this method will shorten the word list to only include words that have all of their characters present on the board, just searching for all characters is less tedious of a task than actually searching all surrounding cells by order and proximity

  def shorten_word_list
    new_list = []
    @word_list.each do |word|
      if check_word_possibility(word) == true
        new_list << word
      end
    end
    return new_list
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

  #checking if the board even has the character included

  def check_board_for_char(char)
    indices = []
    for y in 0..3
      for x in 0..3
        if @board[y][x][:char] == char
          indices << [y, x]
        end
      end
    end
    return indices
  end

  # this is our main method that will check a collection of words against the existing board
  
  def check_board_for_words
    # create a collection to hold the words found in board
    words_in_board = []
    # run method to shorten the possible words based on characters on board alone and not placement of characters
    new_list = shorten_word_list
    new_list.each do |word|
      clear_searched_characters
      # because I slice the strings inside the methods I am saving a duplicate here to be added to the collection if the word is found in the board
      full_word = word.dup
      # once found in board add word to collection
      if check_board_for_string(word) == true
        words_in_board << full_word
      end
    end
    return words_in_board
  end

  # method will break down the indices (if multiple) of the first character of the word and start from there

  def check_board_for_string(string)
    clear_searched_characters
    indices = check_board_for_char(string[0])
    # we shorten the string that we pass on by one character, the character that we have already found on the board
    string.slice!(0)
    indices.each do |index|
      # if any true value is returned back then we pass the true value up to our check_board_for_words method
      @board[index[0]][index[1]][:searched] = true
      if check_for_end_of_word(string, index[0], index[1]) == true
        return true
      end
    end
    return false
  end

  # picking up where our check_board_for_string method left off, here we check for what is left of the string and we start at specific indices
  def check_for_end_of_word(string, y, x)
    # searching for the first character in our newly shortened string
    indices = check_neighbors_for_char(string[0], y, x)
    # if that character is not found in the neighboring cells return false
    if indices == []
      @board[y][x][:searched] = false
      return false
    # if that character is found and it happens to be the last one in our string return true, no further searching in necessary
    elsif string.length == 1
      return true
    # if that character is found and there are still more characters to search for, slice the string and search for the next character recursively
    elsif string.length > 1
      string.slice!(0)
      indices.each do |index|
        results = check_for_end_of_word(string, index[0], index[1])
        # pass the truth on
        if results == true
          return true
        end
      end
    else
      @board[y][x][:searched] = false
      return false
    end
  end

  # method to check the neighboring cells on the matrix for a specific character

  def check_neighbors_for_char(char, y, x)
    # creating a blank collection to hold all of the indices of cells that have our character
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
            if @board[y + i][x + j][:char] === char && @board[y + i][x + j][:searched] == false
              @board[y + i][x + j][:searched] == true
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

  def clear_searched_characters
    @board.each do |row|
      row.each do |cell|
        cell[:searched] = false
      end
    end
  end

end

