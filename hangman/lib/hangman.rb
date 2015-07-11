require 'yaml'

class Hangman
   
  def initialize
    @turns = 9
    @winner = false
    @guesses = []
  end
 
  def game
    game_mode
    until (@turns < 1 || @winner)
      user_choice
      guess
      status
    end
  end
 
  def game_mode
    valid = false
    puts "Enter 1 to load a saved game or press 2 to start a new game:"
    mode = gets.chomp.to_i
    
    until valid
      if (mode > 2 || mode< 1)
        puts "Invalid game mode.  Try again:"
        mode = gets.chomp.to_i
      else
          valid = true
      end
    end
    
    if mode == 1
      game_load 
      puts "\n"
      puts "Load Successfull!"
      puts "Word: #{@game_board.join(" ")}"
      puts "Letters used: #{@guesses.join(",")}"
      puts "Turns remaining: #{@turns}"
      puts "\n"
    else
      valid_words
      random_word
      puts initial_game_board
      puts "\n"
    end
  end
 
  def valid_words
    @valid_words = []
    words = $words
    words.each do |word|
      if ((word.chomp.length >= 5 ) && (word.chomp.length <= 12))
        @valid_words << word.chomp
      end
    end
  end
  
  def random_word
    @solution = @valid_words[rand(@valid_words.length)].upcase.split("")
  end
 
  def initial_game_board
    @game_board = []
    @solution.length.times do
      @game_board << "_"
    end
    return @game_board.join(" ")
  end
 
  def guess
    valid = false
    if @choice == 1
      puts "Enter a letter:"
      @guess = gets.upcase.chomp
      until valid
        if (@guess.length == 1 && ((@guess >= 'a' && @guess <= 'z') || (@guess >= 'A' && @guess <= 'Z')))
          @guesses << @guess
          @solution.each_with_index do |letter, index|
            if letter == @guess
              @game_board[index] = letter
            end
          end
          valid = true
        else
          puts "Enter a valid letter:"
          @guess = gets.upcase.chomp
        end
      end
    elsif @choice == 2
      puts "Enter your solution:"
      word_guess = gets.upcase.chomp.split("")
      if word_guess == @solution
        @game_board = word_guess
      else
        puts "nope! good guess though."
      end
    elsif @choice == 3
      game_save
      abort("Your game was saved!")
    end
   
  end

  def status
    if @game_board == @solution
        @winner = true
        puts "\n"
        puts "Word: #{@game_board.join}"
        puts "Congratulations! You win!"
    elsif (@turns == 1)
      puts "\n"
      puts "You lose! Try again!"
      puts "The answer was #{@solution.join}"
      @turns -= 1
    else
      @turns -= 1
      puts "\n"
      puts "Word: #{@game_board.join(" ")}"
      puts "Letters used: #{@guesses.join(",")}"
      puts "Turns remaining: #{@turns}\n"
    end
  end
  
  
  def game_save
    savefile = File.new("game_save.csv","w")
    save = "#{@turns}, #{@guesses.join}, #{@solution.join}, #{@game_board.join}"
    savefile << save
    savefile.close
  end

  def game_load
    if File.exists?('game_save.csv')
      lines = File.readlines "game_save.csv"
      lines.each do |line|
        columns = line.split(",")
        @turns = columns[0].to_i
        @guesses = columns[1].strip.split("")
        @solution = columns[2].strip.split("")
        @game_board = columns[3].strip.split("")
      end
    else
      abort("Error: No Existing Save File.")
    end
  end
  
  
  
  def user_choice
    valid = false
    puts "Enter 1 to guess a letter, 2 to solve the problem or 3 to save your game:"
    @choice = gets.chomp.to_i
    until valid
      if (@choice > 3 || @choice < 1)
            puts "Invalid game mode.  Try again:"
        @choice = gets.chomp.to_i
      else
          valid = true
      end
     end
  end
  
end

$words = File.readlines "5desk.txt"

new_game = Hangman.new
new_game.game