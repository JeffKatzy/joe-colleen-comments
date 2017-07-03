class Word

  def self.random_word(level)
    #retrieves random word from a dictionary
    if level < 5
      url = Level.all_levels[level-1]
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


  def self.build_word_platform(level)
    #
    word = self.random_word(level)
    # NOTE sandwhich code.
    word_platform = []
    word.chars.map do |letter|
      word_platform << [letter, "_"]
    end
    word_platform
  end



end
