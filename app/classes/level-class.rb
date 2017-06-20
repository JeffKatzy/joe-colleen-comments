class Level

  def self.max_levels
    5
  end

  def self.choose_level(new_hangman)
    begin
      puts "What level would you like to play (1 - 5)?"
      new_hangman.level = gets.chomp.to_i
    end while /[1-5]/.match(new_hangman.level.to_s).nil?
  end

  def self.all_levels
    ["http://www.gutenberg.org/cache/epub/46205/pg46205.txt",
     "https://www.gutenberg.org/files/2591/2591-0.txt",
     "https://www.gutenberg.org/files/11/11-0.txt",
     "http://www.gutenberg.org/cache/epub/5200/pg5200.txt",
    ]
  end

  def self.level_1(new_hangman)
    new_hangman.word.map! do |letters|
      if /[aeiouy]/.match(letters[0])
        [letters[0],letters[0]]
      else
        letters
      end
    end
    new_hangman.letters_picked = ["a","e","i","o","u","y"]
    new_hangman.letters_picked.flatten
  end

  def self.level_2(new_hangman)
    value = ''; 6.times{value  << (65 + rand(25)).chr.downcase}
    new_hangman.word.map! do |letters|
      if /[#{value}]/.match(letters[0])
        [letters[0],letters[0]]
      else
        letters
      end
    end
    new_hangman.letters_picked = value.chars.uniq.map {|x| x}
    new_hangman.letters_picked.flatten
    if new_hangman.word.map {|letters| letters[0]}.join('') == new_hangman.word.map {|letters| letters[1]}.join('')
      new_hangman.word[0][1] = '_'
    end
  end

  def self.level_3(new_hangman)
    new_hangman.word.each do |letters|
      idx += 1
      if (idx+1) % 3 == 0
        letters[1] = letters[0]
        new_hangman.letters_picked << letters[0]
      else
        letters
      end
    end
    new_hangman.word.each do |letter|
      if new_hangman.letters_picked.include?(letter[0])
        letter[1] = letter[0]
      end
    end
  end


  def self.levels_builder(new_hangman)
    #puts out some letters already, makes sure size appropriate as well
    #Level 1: Gets all the vowels
    #Level 2: Gets 6 random letters
    #Level 3: Gets every 3rd letter
    idx=0
    if new_hangman.level == 1
      self.level_1(new_hangman)
    elsif new_hangman.level == 2
      self.level_2(new_hangman)
    elsif new_hangman.level == 3
      self.level_3(new_hangman)
    end
  end
end
