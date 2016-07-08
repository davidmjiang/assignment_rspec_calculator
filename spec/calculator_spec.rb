require 'calculator'


describe Calculator do 

  let(:calc) { Calculator.new }
  let(:new_calc) { Calculator.new(true) }
  
  describe '#add' do 
    it "adds positive numbers" do
      expect(calc.add(4,5)).to eq(9)
    end

    it "adds negative numbers" do 
      expect(calc.add(-1, -2)).to eq(-3)
    end

    it "adds floating point numbers" do 
      expect(calc.add(0.54, 1.2)).to be_within(0.1).of (1.74)
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
      expect(calc.subtract(0.55, 0.15)).to be_within(0.1).of (0.4)
    end
  end

  describe '#multiply' do
    it "multiplies positive numbers" do
      expect(calc.multiply(5,6)).to eq(30)
    end

    it "multiplies negative numbers" do
      expect(calc.multiply(-3,-4)).to eq(12)
    end

    it "multiplies floating point numbers" do
      expect(calc.multiply(0.25,0.8)).to be_within(0.1).of (0.2)
    end
  end

  describe '#divide' do
    it "doesn't allow division by 0" do
      expect{calc.divide(2,0)}.to raise_error(ArgumentError)
    end

    it "returns and integer if there is no remainder" do
      expect(calc.divide(4,2)).to eq(2)
      expect(calc.divide(4,2)).to be_an(Integer)
    end

    it "returns a float if there is a remainder" do
      expect(calc.divide(5,2)).to be_within(0.1).of (2.5)
      expect(calc.divide(5,2)).to be_a(Float)
    end
  end

  describe '#pow' do
    it "raises a number to a positive power" do
      expect(calc.pow(2,3)).to eq(8.0)
    end

    it "raises a number to a negative power" do
      expect(calc.pow(2,-2)).to eq(0.25)
    end

    it "raises a number to a decimal power" do
      expect(calc.pow(27,1/3.0)).to eq(3.0)
    end
  end

  describe '#sqrt' do
    it "returns square root of a positive number" do
      expect(calc.sqrt(25)).to eq(5)
    end

    it "raises error for negative input" do
      expect{calc.sqrt(-3)}.to raise_error(ArgumentError)
    end

    it "returns 2 digit decimals for non-round roots" do
      expect(calc.sqrt(4.5)).to be_within(0.1).of (2.12)
      # expect(calc.sqrt(4.5)).to match(/\d+\.\d\d/)
    end
  end

  describe '#memory' do 
    it "returns nil when no object is in memory" do
      expect(calc.memory).to eq(nil)
    end
    
    it "returns the object in memory when memory is set" do
      calc.memory=(7)
      expect(calc.memory).to eq(7)
    end

    it "clears the memory after returning" do
      calc.memory=(3)
      calc.memory
      expect(calc.memory).to be_nil
    end
  end
  
  describe "#stringify" do 
    it "returns output as a string" do
      expect(new_calc.add(2,3)).to eq("5")
    end
  end


end