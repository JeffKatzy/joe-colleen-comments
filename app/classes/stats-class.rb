class Stats


  def self.ranking_formula()
    #win*(level/5) - #losses*(1-level/6)
  end

  def self.users_with_ranks
    #create formula for ranking
    # NOTE sandwhich code.
    user_ranking = {}
    User.all.each do |user|
      user_ranking[user.user_name] = user.wins - user.losses
    end
    user_ranking
  end

  def self.users_by_ranks
    players = self.users_with_ranks
    players.sort_by {|name,rank| rank}.reverse.map(&:first)
  end

  def self.stats_title
    system('clear')
    puts "%10s %10s %10s %10s" % ["Name","Wins","Losses","Rank"]
    puts "%10s %10s %10s %10s" % ["____", "____", "______", "____"]
  end

  def self.stats_align(name,wins,losses,rank)
    puts "%10s %10s %10s %10s" % [name,wins,losses,rank]
  end

  def self.print_info_by_ranks
    self.stats_title
    self.users_by_ranks.map.with_index do |name, idx|
      # 
      self.stats_align(name,User.find_user(name).wins,User.find_user(name).losses,idx+1)
    end
  end

  def self.all_info
    system('clear')
     #
    User.all.each do |user|
      puts "#{user.user_name}: wins: #{user.wins} losses: #{user.losses}"
    end
  end

end
