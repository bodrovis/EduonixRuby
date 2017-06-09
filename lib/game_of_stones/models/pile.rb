module GameOfStones
  module Models
    class Pile
      attr_reader :stones, :max_take, :min_take

      def initialize(options)
        @stones = options.stones
        @max_take = options.max_take
        @min_take = options.min_take
      end

      def has_enough_stones?(number)
        number.between?(@min_take, @max_take) && number <= @stones
      end

      def take!(number)
        number = number.to_i
        raise IncorrectNumberOfStones.new(self) unless has_enough_stones?(number)
        @stones -= number
      end

      def empty?
        @stones.zero?
      end

      class IncorrectNumberOfStones < StandardError
        def initialize(pile)
          @pile = pile
        end

        def to_s
          "You've entered incorrect number of stones. The possible value is from " +
            "#{@pile.min_take} to #{[@pile.max_take, @pile.stones].min}"
        end
      end
    end
  end
end