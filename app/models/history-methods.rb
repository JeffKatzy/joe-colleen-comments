

def show_history(user)
  game_number = 1
  Hangman.all.each do |game|
    if game.user.user_name == user
      puts "Game # #{game_number}"
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
      game_number +=1
      puts "\n"
    end
  end
  Welcome.wait
end

def view_user_history
  puts "Who was your user?"
  answer = gets.chomp
  system('clear')
  show_history(answer)
end

# def hangman_history(user)
#   system('clear')
#   begin
#     puts "Would you like to see your playing history?"
#     answer = gets.chomp
#   end until /[nyNY]/.match(answer)
#   if /[yY]/.match(answer)
#     show_history(user)
#   end
# end
