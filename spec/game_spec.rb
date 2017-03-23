require "spec_helper"

module TicTacToe
  describe Game do
    context "#new" do
      let(:john) { Player.new('John', 'X') }
      let(:jane) { Player.new('Jane', 'O') }
      let(:game) { Game.new(['John', 'Jane']) }

      it "creates an instance of Game class" do
        expect(game).to be_an_instance_of(Game)
      end

      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [john, jane] }
        game = Game.new(['John', 'Jane'])
        expect(game.current_player).to eq john
      end

      it "randomly selects an other_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [john, jane] }
        game = Game.new(['John', 'Jane'])
        expect(game.other_player).to eq jane
      end
    end

    context '#switch_players' do
      let(:game) { Game.new(['John', 'Jane']) }

      it 'switches roles, current player to other player' do
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end

      it 'switches roles, other player to current player' do
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end
    end
  end
end

