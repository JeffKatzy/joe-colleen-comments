class Welcome

  def self.home
    #A welcome output to our game
    puts "Welcome to Hangman by Colleen & Joe!!"
    puts "Let the games begin!"
    puts " "
  end

  def self.ending(new_hangman)
    if new_hangman.word.map {|letters| letters[0]} == new_hangman.word.map {|letters| letters[1]}
      system("clear")
      puts "Congratulations! You win!!"
      puts "The winning word you completed was: \'#{new_hangman.word.map{|letters| letters[0]}.join('')}\' & you only got #{new_hangman.errors} mistake(s)."
      new_hangman.class.wins += 1
    else
      system("clear")
      new_hangman.print_tree
      puts "Sorry you lost :("
      puts "The word was: #{new_hangman.word.map{|letters| letters[0]}.join('')}"
      new_hangman.class.losses +=1
    end
  end

end
