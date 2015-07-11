require "./lib/hangman.rb"

$words = File.readlines "5desk.txt"

new_game = Hangman.new
new_game.game