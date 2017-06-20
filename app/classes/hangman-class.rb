class Hangman

  attr_accessor :platform, :letters_picked, :errors
  attr_accessor :word, :tree, :wins, :losses, :level
  attr_accessor :user, :win

  @@all = []

  def initialize
    @tree = Tree.build_tree
    Level.choose_level(self)
    @word = Word.build_word_platform(self.level)
    @letters_picked = []
    @errors = 0
    Level.levels_builder(self)
  end

  def self.all
    @@all
  end


  def print_tree
      self.tree.each do |row|
        puts row.join('')
      end
  end


  def add_error
    self.errors +=1
    body_part = Errors.error_array[self.errors]
    Tree.add_part_to_tree(body_part,self)
  end


  def print_word_platform
    puts self.word.map{|letters| letters[1]}.join('')
  end

  def print_guessed_letters
    puts "Picked Letters: #{self.letters_picked.join(' - ')}"
  end

  def update_letters_picked(letter)
    self.letters_picked << letter
  end


end
