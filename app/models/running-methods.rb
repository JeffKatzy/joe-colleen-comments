def run_games
  begin
    user = get_user
    begin_game(pre_game_starters(user))
  end while play_again?
end

def view_stats
  user = view_history_user?
  hangman_history(user)
  view_stats?
end
