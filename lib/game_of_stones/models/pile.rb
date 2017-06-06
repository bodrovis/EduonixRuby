module GameOfStones
  module Models
    class Pile
      STONES_NUM = 10
      MAX_TO_TAKE = 3
      MIN_TO_TAKE = 1

      attr_reader :stones

      def initialize
        @stones = STONES_NUM
      end

      def has_enough_stones?(number)
        number.between?(MIN_TO_TAKE, MAX_TO_TAKE) && number <= stones
      end

      def take!(number)
        number = number.to_i
        raise IncorrectNumberOfStones.new(@stones) unless has_enough_stones?(number)
        @stones -= number
      end

      def empty?
        stones.zero?
      end

      class IncorrectNumberOfStones < StandardError
        def initialize(stones)
          @stones = stones
        end

        def to_s
          "You've entered incorrect number of stones. The possible value is from " +
            "#{Pile::MIN_TO_TAKE} to #{[Pile::MAX_TO_TAKE, @stones].min}"
        end
      end
    end
  end
end