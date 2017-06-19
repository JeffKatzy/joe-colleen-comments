#require_relative '../app/hangman-class.rb'
require_relative '../config/environment.rb'
require_relative '../app/hangman-methods.rb'
require_relative '../app/user-methods.rb'

#Features to add: different levels & options to view different parts of games (wins/losses)

system("clear")
Hangman.welcome
begin
  user = get_user
  begin_game(pre_game_starters(user))
end while play_again?
user = view_history_user?
hangman_history(user)
view_stats?
goodbye!
