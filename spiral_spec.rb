require_relative 'spiral'

describe Spiral do

  before :each do
    @spiral = Spiral.new
  end

  describe "#make_zeroed_array" do
      it "makes a 2 X 2 zeroed matrix" do
        @spiral.make_zeroed_array(2).should == [[0,0],
                                                [0,0]]
      end

      it "makes a 5 X 5 zeroed matrix" do
        @spiral.make_zeroed_array(5).should == [[0,0,0,0,0],
                                                [0,0,0,0,0],
                                                [0,0,0,0,0],
                                                [0,0,0,0,0],
                                                [0,0,0,0,0]]
      end
  end

  describe "#find_center" do

    it "finds the center as the middle square in an odd columned matrix" do
      @spiral.find_center(3).should == [1, 1]
      @spiral.find_center(5).should == [2, 2]
    end

    it "finds the center as the upper left square of the center 4 squares in an even-columned matrix" do
      @spiral.find_center(4).should == [1, 1]
      @spiral.find_center(6).should == [2, 2]
    end
  end

  describe "#next_direction" do
    it "gives the next appropriate left spiral direction based on previous direction" do
      @spiral.next_direction(:right).should == :up
      @spiral.next_direction(:up).should    == :left
      @spiral.next_direction(:left).should  == :down
      @spiral.next_direction(:down).should  == :right
    end
  end

  describe "#next_coord" do
    it "gives the next coordiate based on the next direction and previous coordinate" do
      @spiral.next_coord(:right, [2, 2]).should == [2, 3]
      @spiral.next_coord(:down, [2, 2]).should  == [3, 2]
      @spiral.next_coord(:left, [2, 2]).should  == [2, 1]
      @spiral.next_coord(:up, [2, 2]).should    == [1, 2]
    end
  end

  describe "#left_spiral" do
    it "populates an array with integers ascending from one from center spiraling out to the left" do
      result_3x3 = [[5, 4, 3],
                    [6, 1, 2],
                    [7, 8, 9]]

      result_4x4 = [[5, 4, 3, 12],
                    [6, 1, 2, 11],
                    [7, 8, 9, 10],
                    [0, 0, 0,  0]]

      result_5x5 = [[17, 16, 15, 14, 13],
                    [18,  5,  4,  3, 12],
                    [19,  6,  1,  2, 11],
                    [20,  7,  8,  9, 10],
                    [21, 22, 23, 24, 25]]

      result_8x8 = [[37, 36, 35, 34, 33, 32, 31, 56],
                    [38, 17, 16, 15, 14, 13, 30, 55],
                    [39, 18,  5,  4,  3, 12, 29, 54],
                    [40, 19,  6,  1,  2, 11, 28, 53],
                    [41, 20,  7,  8,  9, 10, 27, 52],
                    [42, 21, 22, 23, 24, 25, 26, 51],
                    [43, 44, 45, 46, 47, 48, 49, 50],
                    [ 0,  0,  0,  0,  0,  0,  0,  0]]

      zeroed_input_array_3x3 = @spiral.make_zeroed_array(3)
      zeroed_input_array_4x4 = @spiral.make_zeroed_array(4)
      zeroed_input_array_5x5 = @spiral.make_zeroed_array(5)
      zeroed_input_array_8x8 = @spiral.make_zeroed_array(8)

      @spiral.left_spiral(zeroed_input_array_3x3, 3).should == result_3x3
      @spiral.left_spiral(zeroed_input_array_4x4, 4).should == result_4x4
      @spiral.left_spiral(zeroed_input_array_5x5, 5).should == result_5x5
      @spiral.left_spiral(zeroed_input_array_8x8, 8).should == result_8x8
    end
  end


end
