require "rspec"
require "rspec-parameterized"
require "reflector"
require "rspec-parameterized"

describe "Reflector" do

  before(:all) do
    @reflector = Reflector.new()
  end

  where(:signal1, :signal2) do
    [
        [ 0, 24],
        [ 1, 17],
        [ 2, 20],
        [ 3, 7],
        [ 4, 16],
        [ 5, 18],
        [ 6, 11],
        [ 8, 15],
        [ 9, 23],
        [ 10, 13],
        [ 12, 14],
        [ 19, 25],
        [ 19, 25],
        [ 21, 22]
    ]
  end

  with_them do
    it "reflect should reflect signal1 to signal2" do
      @reflector.reflect(signal1).should() == signal2
    end
    it "reflect should reflect signal2 to signal1" do
      @reflector.reflect(signal2).should() == signal1
    end
  end

end