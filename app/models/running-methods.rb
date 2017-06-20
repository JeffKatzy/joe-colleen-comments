def player_options

  puts "___________________"
  puts "| New Game: \"N\" |"
  puts "| Stats   : \"S\" |"
  puts "| History : \"H\" |"
  puts "| Quit    : \"Q\" |"
  puts "__________________"

  answer_conversion(gets.chomp)
end

def answer_conversion(answer)
  case answer
  when "N", "n"
    1
  when "S", "s"
    2
  when "H", "h"
    3
  when "Q", "q"
    4
  else
    5
  end
end


# def play_again?
#   begin
#    puts "Would you like to play again?"
#    answer = gets.chomp
#   end until /[nyNY]/.match(answer)
#   /[yY]/.match(answer) ? true : false
# end

def run_games
    user = get_user
    begin_game(pre_game_starters(user))
end

def view_stats
  puts " "
  Stats.print_info_by_ranks
  puts " "
  puts " "
  Welcome.wait
  #user = view_history_user?
  #hangman_history(user)
  #view_stats?
end

def goodbye!
  puts "We loved having you play CJ Hangman. Come again soon!"
end
