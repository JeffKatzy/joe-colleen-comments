require_relative '../classes/hangman-class.rb'

def check_letter(letter, new_hangman)
  #checks that the character is really a letter
  if new_hangman.letters_picked.include?(letter)
    puts "You already picked that letter :)"
  end
  /[a-zA-Z]/.match(letter) && letter.length == 1 && !new_hangman.letters_picked.include?(letter)
end

def request_letter(new_hangman)
  #recevies a letter -- checks if its acceptable
  begin
    puts "Guess a letter"
    new_letter = gets.chomp.downcase
  end while !check_letter(new_letter,new_hangman)
  new_hangman.letters_picked << new_letter
  new_letter
end


def right_guess(new_letter,new_hangman)
  new_hangman.word.map! do |letter|
    if new_letter == letter[0]
      [new_letter,new_letter]
    else
      [letter[0],letter[1]]
    end
  end
  puts "#{new_letter} is correct! Keep up the good work!"
end

def wrong_guess(new_letter,new_hangman)
  new_hangman.add_error
end

def right_wrong_guess(new_letter, new_hangman)
    if new_hangman.word.map{|letter| letter[0]}.include?(new_letter)
      right_guess(new_letter, new_hangman)
    else
      wrong_guess(new_letter, new_hangman)
    end
end

def game_end?(new_hangman)
  new_hangman.word.map{|letter| letter[1]}.include?('_') &&
  new_hangman.errors < Errors.max_errors
end

def pre_game_starters(user)
  #Builds the emptry tree, generates a random word, and creaets the guessing lines
  new_hangman = Hangman.new
  new_hangman.user = user
  new_hangman
end


def play_again?
  begin
   puts "Would you like to play again?"
   answer = gets.chomp
  end until /[nyNY]/.match(answer)
  /[yY]/.match(answer) ? true : false
end

def goodbye!
  puts "For your records you won #{Stats.wins} game(s) & lost #{Stats.losses} game(s)."
  puts "We loved having you play CJ Hangman. Come again soon!"
end

def begin_game(new_hangman)
  begin
    system("clear")
    new_hangman.print_tree
    new_hangman.print_word_platform
    new_letter = request_letter(new_hangman)
    right_wrong_guess(new_letter, new_hangman)
  end while game_end?(new_hangman)
  Hangman.all << new_hangman
  Welcome.ending(new_hangman)
end
