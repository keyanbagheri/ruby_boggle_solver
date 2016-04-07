

This line is here to show our very smart students 'team div_and_conquer' an example of a simple merge conflict.



###Boggle Solver (in Ruby)

[Boggle](http://en.wikipedia.org/wiki/Boggle) is a word game played with alphabetic letter tiles arranged randomly on a grid. Players must identify words spelled by sequential adjacent letters in any direction (horizontally, vertically or diagonally), but may not use the same letter tile twice.

## Challenge


Write a program that solves a 4x4 randomly arranged Boggle grid.



######The tests and methods were written in ruby using rspec



#####How to run the tests.

1. `cd` into the repo directory.
2. Run the command `gem install rspec` to install the rspec gem.
3. Run the command `rspec spec` to execute the rspec tests that are included inside the directory titled 'spec'



#####Future features.

- Ruling out of words that are not included in the boggle board could possibly be done quicker by starting the initial character search with the character that is used the least in the alphabet (and thereby most unique). 

  I.E. searching for 'x' or 'q' before 'a' or 's' would possibly speed up the process and eliminate some words quicker.



## Going Even Further

- What external resources would help?
  - A dictionary API to be able to actually check our board against a large collection of valid words
- What factors impact performance? What would you do to improve them?
  - It is still uncertain if it is faster to check the board against the word bank or the word bank against the board. In my opinion it seems obvious that checking the word bank first and seeing if the word is included in the board would be faster, however, without researching the two different methods it would be uncertain. I would need to develop two versions of the Boggle solver and check their speed.
- What are the key data structures in use here? What makes them more appropriate than alternatives?
  - Our Boggle game is a Ruby class data structure. It holds our data fields like the board and the word list as well as several methods that are used to solve whether the word list contains words that can be made using characters on the board
  - The board (seeded) is an array of arrays holding strings which essentially forms a matrix to hold all of the characters by row and then cell. I think in a future iteration of this I will have the arrays holding hashes in order to give each character the ability to be marked as being searched over or not. 
  - Our word list (seeded) is simply an array of strings
  - Several of the methods involved also use arrays to store data (indices to indicate the position of different characters)
- Can your solution handle words that occur within other words? i.e. 'catcher' -> ['cat', 'catch', 'her']
  - Yes. Another benefit of searching from the word list first (as opposed to searching from the board of characters) is that we search for each word individually. Even if 'cat' and 'catch' are in the same word bank it doesn't matter because their individual searches do not affect each other.

