module GameOfStones
  module Models
    class Player
      attr_reader :name

      def initialize(name)
        name.strip!
        raise IncorrectName if name.empty?
        @name = name
        @time_per_turn = []
      end

      def make_turn(pile)
        @time_per_turn << measure_time { take_stones_from(pile) }
      end

      def avg_time_per_turn
        begin
          @time_per_turn.reduce(:+) / @time_per_turn.length
        rescue ZeroDivisionError
          'n/a'
        end
      end

      def info
        "\n\nPlayer: #{name}\nAvg. time per turn: #{avg_time_per_turn}"
      end

      def to_s
        name
      end

      private

      def measure_time
        if block_given?
          time_before = Time.now
          yield
          waited_for = Time.now - time_before
          say "Time: #{waited_for}"
          waited_for
        end
      end

      def take_stones_from(pile)
        say "The current number of stones is: #{pile.stones}"
        say "Player #{name}, it is your turn now!"

        begin
          pile.take! $stdin.gets
        rescue GameOfStones::Models::Pile::IncorrectNumberOfStones => e
          say e, :warning
          retry
        end
      end

      class IncorrectName < StandardError
        def to_s
          'The name cannot be empty!'
        end
      end
    end
  end
end