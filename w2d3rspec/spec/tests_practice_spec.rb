require 'rspec'
require 'tests_practice'

describe "Array Utility Methods" do
  subject(:array) { [1, 0, 1, 2, 3, 4] }
  let(:array_2d) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  describe "#uniq" do
    it "makes a unique array" do
      expect(array.uniq).to eq([1, 0, 2, 3, 4])
    end
  end

  describe "#to_sum" do
    it "sums up all values within an array" do
      expect(array.to_sum).to eq(11)
    end
  end

  describe "#my_transpose" do
    it "transposes a two-dimensional array" do
      expect(array_2d.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    it "picks the optimal stock buy and sell time" do
      expect(array.stock_picker).to eq([1,5])
    end
  end
end
