class GamePlay
  
  attr_accessor :guessCount, :code

  def initialize
    @guessCount = 0
    @code = generateCode
    p code
  end

  def generateCode
    6.times.map{rand(6)}
  end

  def playerGuess
    self.guessCount += 1
    puts "Please guess a 6 digit code with numbers from 0-5"
    gets
  end

  def checkGuess
    currentGuess = playerGuess.chomp.chars.map(&:to_i)
    correctColors = 6
    correctPlaces = 0

    # checks how many actual spots are guessed correctly
    self.code.each_with_index do |n, i|
      if self.code[i] == currentGuess[i]
        correctPlaces += 1
      end
    end

    # checks how many colors were guessed correctly overall
    self.code.uniq.each do |n|
      correctColors -= [0, self.code.count(n) - currentGuess.count(n)].max
    end

    if correctColors == 6 && correctPlaces == 6 
      puts "Congrats, you won! Do you want to play again? (Y/N)"
      answer = gets
    else
      if self.guessCount == 12
        p "You've used up all 12 of your guesses and didn't get it right. You lose!"
      else
        p "You have guessed #{correctColors} colors correctly and #{correctPlaces} places correctly. You have #{12 - guessCount} tries left. Please guess again!"  
        checkGuess
      end
    end

    def resetGame
      
    end
  end


end

newGame = GamePlay.new

newGame.checkGuess