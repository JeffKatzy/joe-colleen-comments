class User

  attr_accessor :user_name, :hangman_history

  def initialize(user_name)
    @user_name = user_name
  end

  def self.new_user?(user_name)
    self.all.find do |user|
      user_name == user.user_name
    end
  end

  def self.new_or_existing(user_name)
    if self.new_user?(user_name)
      self.new_user?(user_name)
    else
      self.new(user_name)
    end
  end

  def self.all
    Hangman.all.map do |game|
      game.user
    end.uniq
  end

  def save(hangman)
    self.hangman_history = hangman
    self.class.all << self
  end

  def self.find_user(user_name)
    self.all.find do |user|
      user.user_name == user_name
    end
  end

  def wins
    sum = 0
    Hangman.all.each do |game|
      sum+=1 if self == game.user && game.win
    end
    sum
  end

  def losses
    sum = 0
    Hangman.all.each do |game|
      sum+=1 if self == game.user && !game.win
    end
    sum
  end

end
