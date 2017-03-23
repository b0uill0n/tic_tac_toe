require "spec_helper"

module TicTacToe
  describe Player do
    context "#new" do
      let(:player) { Player.new('John', 'X') }

      it "returns the player's name" do
        expect(player.name).to eq('John')
      end

      it "returns the mark" do
        expect(player.mark).to eq('X')
      end
    end

    context "#place" do
      let(:player) { Player.new('Jane', 'O') }

      it "returns hash with the keys: id, mark" do
        output = { id: 1, mark: 'O' }
        expect(player.place(1)).to eq output
      end
    end
  end
end

