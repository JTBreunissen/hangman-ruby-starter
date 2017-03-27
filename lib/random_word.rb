class RandomWord
  attr_reader :word, :word_array, :answer_array

  WORDS = %w(test ruby rails framework method object controller views assets image github app uploaders database routes migrationfiles postgres)
  VALID_INPUT = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
  "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


  def initialize
    @word = WORDS.sample
    @word_array = @word.chars.to_a
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

  def contains? (answer_array)
    gamesword = Set.new(word.scan(/./))
    playerinput = Set.new(answer_array)
    gamesword.sort == playerinput.sort
  end
end
