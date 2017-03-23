require_relative './lib/tic_tac_toe.rb'

print "Enter the name of player 1: "
player1 = gets.chomp

puts
print "Enter the name of player 2: "
player2 = gets.chomp

game = TicTacToe::Game.new([player1, player2])
game.play

