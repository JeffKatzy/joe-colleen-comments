#require_relative '../app/hangman-class.rb'
require_relative '../config/environment.rb'
require_relative '../app/models/hangman-methods.rb'
require_relative '../app/models/running-methods.rb'
require_relative '../app/models/user-methods.rb'

#Features to add: different levels & options to view different parts of games (wins/losses)

system("clear")
Welcome.home
run_games
view_stats
goodbye!
