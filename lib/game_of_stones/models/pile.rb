module GameOfStones
  module Models
    class Pile
      STONES_NUM = 10
      MAX_TO_TAKE = 3
      MIN_TO_TAKE = 1

      attr_accessor :stones

      def initialize
        @stones = STONES_NUM
      end

      def has_enough_stones?(number)
        number.between?(MIN_TO_TAKE, MAX_TO_TAKE) && number <= stones
      end

      def take!(number)
        @stones -= number if has_enough_stones?(number)
      end

      def empty?
        stones.zero?
      end
    end
  end
end