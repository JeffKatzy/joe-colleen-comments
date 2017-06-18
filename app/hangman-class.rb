class Hangman

  attr_accessor :platform, :letters_picked, :errors
  attr_accessor :word, :tree, :wins, :losses

  @@sum = 0
  @@all = []
  @@wins = 0
  @@losses = 0

  def initialize
    @tree = self.class.build_tree
    @word = self.class.random_word
    @word = self.build_word_platform
    @letters_picked = []
    @errors = 0
    @@sum += 1
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

  def self.max_errors
    6
  end

  def self.error_array
    ["","O","(",")","|","<",">"]
  end

  def self.mistake_tree_arr
    [[" ", "O", " "],
     ["(", "|", ")"],
     [" ", "|", " "],
     ["<", " ", ">"]]
  end

  def self.random_word
    #retrieves random word from a dictionary
    url = "http://www.gutenberg.org/cache/epub/5200/pg5200.txt"
    page = open(url) do |f|
      page_string = f.read
    end
    new_page = page.downcase.gsub(/[\n]/i,' ').gsub(/[^a-z ]/i, '').split(' ')
    random_number = rand(0..new_page.length)
    new_page[random_number]
  end

  def self.build_tree
    newtree = []
    newtree << [" ","_","_","_"]
    newtree << [" ","|"," ","|"]
    (1..5).each do
      newtree << [" "," "," ","|"]
    end
    newtree << [" "," ","-","-"]
    newtree
  end

  def print_tree
      self.tree.each do |row|
        puts row.join('')
      end
  end

  def build_word_platform
    word_platform = {}
    word.chars.map do |letter|
      word_platform[letter] = "_"
    end
    word_platform
  end

  def print_word_platform
    puts self.word.values.join('')
  end

  def add_part_to_tree(body_part)
    self.class.mistake_tree_arr.each_with_index do |v, row|
      v.each_with_index do |vv, column|
        if self.class.mistake_tree_arr[row][column] == body_part
          self.tree[row+2][column] = body_part
        end
      end
    end
  end

  def add_error
    self.errors +=1
    body_part = self.class.error_array[self.errors]
    self.add_part_to_tree(body_part)
  end

  def self.welcome
    #A welcome output to our game
    puts "Welcome to Hangman by Colleen & Joe!!"
    puts "Let the games begin!"
    puts " "
  end

  def ending
    if self.word.values == self.word.keys
      puts "Congratulations! You win!!"
      self.class.wins += 1
    else
      system("clear")
      self.print_tree
      puts "Sorry you lost :("
      puts "The word was: #{self.word.keys.join('')}"
      self.class.losses +=1
    end
  end

  def update_letters_picked(letter)
    self.letters_picked << letter
  end


end
