module TicTacToe
  class Game
    attr_reader :current_player, :other_player

    def initialize(players)
      @player1 = Player.new(players[0], 'X')
      @player2 = Player.new(players[1], 'O')
      @players = [@player1, @player2]
      @board = Board.new
      @current_player, @other_player = @players.shuffle
    end

    def play
      print_intro

      while true
        @board.print
        input_and_process
        print_game_over if @board.game_over
        switch_players
      end
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    private

    def input_and_process
      begin
        puts
        print "#{@current_player.name}, enter a number between 1 and 9 to make your move: "
        input = gets.chomp
        valid = verify_input(input)
        move = @current_player.place(valid)
        @board.process_move(move)
      rescue => e
        puts e
        retry
      end
    end

    def verify_input(input)
      output = input.to_i

      type_error = "Invalid input! You have to enter an integer!"
      raise TypeError.new(type_error) if input =~ /[^0-9]/

      range_error = "Input is out of range. Enter a number between 1 and 9!"
      raise IndexError.new(range_error) unless output.between?(1, 9)

      output
    end

    def print_intro
      puts
      puts "***Tic-Tac-Toe Game***"
      puts
      puts "Let's get ready to rumble!"
      print "#{@player1.name} is represented by \'#{@player1.mark}\' VERSUS "
      puts "#{@player2.name} is represented by \'#{@player2.mark}\'."
      puts
      puts "#{@current_player.name} has randomly been selected as the first player."
    end

    def print_game_over
      puts
      case @board.game_over
      when :win
        puts "#{@current_player.name} won!"
      when :tie
        puts "The game ended in a tie!"
      end

      @board.print
      rematch
    end

    def rematch
      answer = ''

      until %w(y n).include?(answer)
        puts
        print "Do you want a rematch? [y/n]: "
        answer = gets.chomp.downcase
      end

      new_game if answer == 'y'
      exit if answer == 'n'
    end

    def new_game
      @board = Board.new
      @current_player, @other_player = @players.shuffle
      play
    end
  end
end
