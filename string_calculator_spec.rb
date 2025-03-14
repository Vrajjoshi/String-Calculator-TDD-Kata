require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number itself if only one number is given" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns sum of two numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "returns sum for multiple numbers" do
    expect(calculator.add("1,2,3,4")).to eq(10)
  end

  it "handles new lines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "throws an exception for negative numbers" do
    expect { calculator.add("-1,2") }.to raise_error("negative numbers not allowed -1")
  end

  it "throws an exception with all negative numbers" do
    expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed -2,-3")
  end
end
