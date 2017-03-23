require "spec_helper"

module TicTacToe
  describe Cell do
    context "#new" do
      let(:cell) { Cell.new(1) }

      it "is initialized with an id" do
         expect(cell.id).to eq(1)
      end

      it "has a mark of nil by default" do
         expect(cell.mark).to be_nil
      end
    end

    describe "#insert" do
      context "insert mark into the cell once" do
        let(:cell) { Cell.new(1) }

        it "default mark should be nil" do
          expect(cell.mark).to be_nil
        end

        it "the cell should be able to change its own mark" do
          cell.insert('X')
          expect(cell.mark).to eq('X')
        end
      end

      context "insert mark into the cell two times" do
        let(:cell) { Cell.new(1, 'X') }

        it "it will raise a RuntimeError" do
          expect{ cell.insert('X') }.to raise_error(RuntimeError)
        end
      end
    end
  end
end

