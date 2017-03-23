require "spec_helper"

module TicTacToe
  describe Board do
    context "#new" do
      it "initializes the board" do
        expect { Board.new }.to_not raise_error
      end
    end

    context '#process_move' do
      let(:cell_id) { 1 }
      let(:board) { Board.new }
      let(:player) { Player.new("John", "X") }

      it 'updates the value of the cell object' do
        board.process_move(player.place(cell_id))
        expect(board.grid[0][0].mark).not_to(be_nil)
        expect(board.grid[0][0].mark).to eq('X')
      end
    end

    context "#game_over" do
      let(:board) { Board.new }
      let(:player1) { Player.new('John', 'X') }
      let(:player2) { Player.new('Jane', 'O') }

      it "returns false before making any moves" do
        expect(board.game_over).to eq false
      end

      it "returns :win if winner? is true" do
        allow(board).to receive(:winner?) { true }
        expect(board.game_over).to eq :win
      end

      it "returns :tie if tie? is true" do
        allow(board).to receive(:tie?) { true }
        expect(board.game_over).to eq :tie
      end

      it "returns :win when row has objects with values that are all the same" do
        board.process_move(player1.place(1))
        board.process_move(player2.place(4))
        board.process_move(player1.place(2))
        board.process_move(player2.place(5))
        board.process_move(player1.place(3))
        expect(board.game_over).to eq :win
      end

      it "returns :win when colum has objects with values that are all the same" do
        board.process_move(player1.place(1))
        board.process_move(player2.place(2))
        board.process_move(player1.place(4))
        board.process_move(player2.place(3))
        board.process_move(player1.place(7))
        expect(board.game_over).to eq :win
      end

      it "returns :win when diagonal has objects with values that are all the same" do
        board.process_move(player1.place(1))
        board.process_move(player2.place(2))
        board.process_move(player1.place(5))
        board.process_move(player2.place(3))
        board.process_move(player1.place(9))
        expect(board.game_over).to eq :win
      end

      it "returns :tie when all spaces on the board are taken" do
        board.process_move(player1.place(1))
        board.process_move(player2.place(5))
        board.process_move(player1.place(2))
        board.process_move(player2.place(3))
        board.process_move(player1.place(7))
        board.process_move(player2.place(4))
        board.process_move(player1.place(6))
        board.process_move(player2.place(8))
        board.process_move(player1.place(9))
        expect(board.game_over).to eq :tie
      end
    end
  end
end

