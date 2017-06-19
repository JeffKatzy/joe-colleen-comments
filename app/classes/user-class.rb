class User

  attr_accessor :user_name, :hangman_history
  @@all = []

  def initialize(user_name)
    @user_name = user_name
  end

  def self.all
    @@all
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

  def self.new_or_old_user(user_name)
    if self.find_user(user_name)
      self.find_user(user_name)
    else
      User.new(user_name)
    end
  end

  def self.stats
    
  end

end
