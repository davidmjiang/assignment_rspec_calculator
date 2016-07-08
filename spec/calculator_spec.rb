require 'calculator'


describe Calculator do 
  # before(:each) do 
  #   calc = Calculator.new
  # end
  let(:calc) {Calculator.new}

  describe '#add' do 
    it "adds positive numbers" do
      expect(calc.add(4,5)).to eq(9)
    end

    it "adds negative numbers" do 
      expect(calc.add(-1, -2)).to eq(-3)
    end

    it "adds floating point numbers" do 
      expect(calc.add(0.54, 1.2)).to be_within(0.5).of (1.74)
    end
  end

  describe '#subtract' do 
    it "subtracts positive numbers" do 
      expect(calc.subtract(5, 4)).to eq(1)
    end

    it "subtracts negative numbers" do 
      expect(calc.subtract(-4, -5)).to eq(1)
    end

    it "subtracts floating point numbers" do 
      expect(calc.subtract(0.55, 0.15)).to be_within(0.3).of (0.4)
    end
  end

  describe '#multiply' do

  end

end