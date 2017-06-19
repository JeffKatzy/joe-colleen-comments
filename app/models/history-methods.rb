

def show_history(user)
  Hangman.all.each do |game|
    if game.user_name = user
      puts "Game # #{game.game_number}"
      puts "Game Level: #{game.level}"
      game.print_tree
      if game.word.map {|letters| letters[1]} == game.word.map {|letters| letters[0]}
        puts "The word: \'#{game.word.map {|letters| letters[0]}.join('')}\'"
        puts "You won this round! :)"
      else
        puts game.word.map {|letters| letters[1]}.join('')
        puts game.word.map {|letters| letters[0]}.join('')
        puts "You lost this round :("
      end
      puts "\n"
    end
  end
end

def hangman_history(user)
  system('clear')
  begin
    puts "Would you like to see your playing history?"
    answer = gets.chomp
  end until /[nyNY]/.match(answer)
  if /[yY]/.match(answer)
    show_history(user)
  end
end
