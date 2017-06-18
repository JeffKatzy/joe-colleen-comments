#require_relative '../app/hangman-class.rb'
require_relative '../config/environment.rb'
require_relative '../app/hangman-methods.rb'

#Features to add: different levels & options to view different parts of games (wins/losses)

begin
  begin_game(pre_game_starters)
end while play_again?
goodbye!
