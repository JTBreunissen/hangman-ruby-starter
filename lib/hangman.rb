require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @random_word = RandomWord.new
    @bad_guesses_left = 10
    @answer_array = []
    @bad_guesses = 0
  end

  def play!
    welcome
    while @bad_guesses_left > 0 do
      valid_input_print
      puts "\n\n\n"
      puts "Bad guesses Remaining: #{@bad_guesses_left}"
      puts "\n\n"
      get_user_answer
      evaluation
      display_guessword
      if word_guessed?
        puts "Congratulations, you beat the hangman"
        puts "The word was #{@random_word.word_array.join("").upcase}"
        break
      end
    end
    if !word_guessed?
      puts "\n\n\n"
      puts "Today is not your lucky day: The Hangman got you!"
      puts "\n\n\n"
    end
  end

    def welcome
      puts "********************************************************************"
      puts "*********************Welcome to HANGMAN*****************************"
      puts "*You have 10 lives, each time you guess a wrong letter, you lose 1.*"
      puts "*************When you reach 0 lives, it's GAME OVER*****************"
      puts "********************************************************************"
      puts "\n "
    end

    def valid_input_print
      puts "valid input for guess: "
      RandomWord::VALID_INPUT.each do |x|
        print "#{x} "
      end
    end

    def display_guessword
      puts "This is what the word looks like now: "
      puts "#{@random_word.positions_for(characters: @answer_array)}"
    end

    def get_user_answer
      puts "What will be your guess? what will be your pick? \n   Better hurry up now, cause the rope is quick! "
      puts "\n\n"
      print "Your guess: "
      @answer = gets.chomp
    end

    def evaluation
      unless @random_word.word.include?(@answer)
      puts "Sadly, we are not looking for that letter"
      lose_life
      else
        @answer_array << @answer
        @random_word.positions_for(characters: @answer_array)
      end
    end

    def word_guessed?
      @random_word.contains?(@answer_array)
    end

    def lose_life
      @bad_guesses_left -= 1
    end
end
