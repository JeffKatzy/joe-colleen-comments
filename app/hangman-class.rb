class Hangman

  attr_accessor :platform, :letters_picked, :errors
  attr_accessor :word, :tree, :wins, :losses, :level

  @@sum = 0
  @@all = []
  @@wins = 0
  @@losses = 0

  def initialize
    @tree = self.class.build_tree
    self.choose_level
    @word = self.random_word
    @word = self.build_word_platform
    @letters_picked = []
    @errors = 0
    self.levels_builder
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

  def all_levels
    ["http://www.gutenberg.org/cache/epub/46205/pg46205.txt",
     "https://www.gutenberg.org/files/2591/2591-0.txt",
     "https://www.gutenberg.org/files/11/11-0.txt",
     "http://www.gutenberg.org/cache/epub/5200/pg5200.txt",
    ]
  end

  def levels_builder
    #puts out some letters already, makes sure size appropriate as well

    if self.level == 1
      self.word.map! do |letters|
        if /[aeiouy]/.match(letters[0])
          [letters[0],letters[0]]
        else
          letters
        end
      end
      self.letters_picked << ["a","e","i","o","u","y"]
      self.letters_picked.flatten
    elsif self.level == 2
      self.word.map! do |letters|
        if /[rtslmn]/.match(letters[0])
          [letters[0],letters[0]]
        else
          letters
        end
      end
      self.letters_picked << ["r","t","s","l","m","n"]
      self.letters_picked.flatten
    elsif self.level == 3
      self.word.map!.with_index do |letters, idx|
        if (idx+1) % 3 == 0
          [letters[0],letters[0]]
          self.letters_picked << letters[0]
        else
          letters
        end
      end
    end
  end

  def random_word
    #retrieves random word from a dictionary
    if self.level < 5
      url = self.all_levels[self.level-1]
      page = open(url) do |f|
        page_string = f.read
      end
      new_page = page.downcase.gsub(/[\n]/i,' ').gsub(/[^a-z ]/i, '').split(' ')
      random_number = rand(0..new_page.length)
      new_page[random_number]
   else
     RandomWordGenerator.word
   end
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
    word_platform = []
    word.chars.map do |letter|
      word_platform << [letter, "_"]
    end
    word_platform
  end

  def print_word_platform
    puts self.word.map{|letters| letters[1]}.join('')
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

  def choose_level
    puts "What level would you like to play (1 - 5)?"
    self.level = gets.chomp.to_i
  end

  def ending
    if self.word.map {|letters| letters[0]} == self.word.map {|letters| letters[1]}
      system("clear")
      puts "Congratulations! You win!!"
      puts "The winning word you completed was: \'#{self.word.map{|letters| letters[0]}.join('')}\' & you only got #{self.errors} mistake(s)."
      self.class.wins += 1
    else
      system("clear")
      self.print_tree
      puts "Sorry you lost :("
      puts "The word was: #{self.word.map{|letters| letters[0]}.join('')}"
      self.class.losses +=1
    end
  end

  def update_letters_picked(letter)
    self.letters_picked << letter
  end


end
