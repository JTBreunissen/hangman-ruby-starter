class RandomWord
  attr_reader :word, :word_array, :answer_array

  WORDS = %w(test)
  VALID_INPUT = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
  "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


  def initialize
    @word = WORDS.sample
    @word_array = @word.chars.to_a
  end

  def setup_guessword
    word_array.each do |c|
      print "_,"
    end
  end

  def positions_for(characters: [])
    pos = position_setup
      for c in 0...pos.length
      for a in 0...characters.length
      pos[c] = characters[a] if self.word[c] == characters[a]
      end
    end
    return pos
  end

  def position_setup
    self.word.split(//).map{|c| ""}
  end

  def amount_bad_guesses(characters)
    bad_guesses=0
    bad_guess_array = characters - @word_array
    @bad_guesses = bad_guess_array.count
    return @bad_guesses
  end

  def contains? (player_selections)
    gamesword = Set.new(self.word.split(//))
    playerinput = Set.new(player_selections)
    gamesword.subset?(playerinput)
  end



end
