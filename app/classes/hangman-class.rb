class Hangman

  attr_accessor :platform, :letters_picked, :errors
  attr_accessor :word, :tree, :wins, :losses, :level, :game_number
  attr_accessor :user

  @@sum = 0
  @@all = []
  @@wins = 0
  @@losses = 0

  def initialize
    @tree = Tree.build_tree
    self.choose_level
    @word = Word.build_word_platform(self.level)
    @letters_picked = []
    @errors = 0
    Level.levels_builder(self)
    @@sum += 1
    self.game_number = @@sum
  end

  def self.sum
    @@sum
  end

  def self.all
    @@all
  end

  def self.wins
    @@wins
  end

  def self.wins=(value)
    @@wins = value
  end

  def self.losses
    @@losses
  end

  def self.losses=(value)
    @@losses = value
  end


  def print_tree
      self.tree.each do |row|
        puts row.join('')
      end
  end


  def add_part_to_tree(body_part)
    Tree.mistake_tree_arr.each_with_index do |v, row|
      v.each_with_index do |vv, column|
        if Tree.mistake_tree_arr[row][column] == body_part
          self.tree[row+2][column] = body_part
        end
      end
    end
  end

  def add_error
    self.errors +=1
    body_part = Errors.error_array[self.errors]
    self.add_part_to_tree(body_part)
  end

  def choose_level
    begin
      puts "What level would you like to play (1 - 5)?"
      self.level = gets.chomp.to_i
    end while /[1-5]/.match(self.level.to_s).nil?
  end

  def print_word_platform
    puts self.word.map{|letters| letters[1]}.join('')
  end

  def update_letters_picked(letter)
    self.letters_picked << letter
  end


end
