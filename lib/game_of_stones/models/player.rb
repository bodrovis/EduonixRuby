module GameOfStones
  module Models
    class Player
      attr_reader :name

      def initialize(name)
        @name = name
        @time_per_turn = []
      end

      def make_turn!(pile)
        @time_per_turn << measure_time { take_stones_from(pile) }
      end

      def avg_time_per_turn
        @time_per_turn.reduce(:+) / @time_per_turn.length
      end

      def info
        "\n\nPlayer: #{name}\nAvg. time per turn: #{avg_time_per_turn}"
      end

      private

      def measure_time
        if block_given?
          time_before = Time.now
          yield
          waited_for = Time.now - time_before
          puts "Time: #{waited_for}"
          waited_for
        end
      end

      def take_stones_from(pile)
        puts "The current number of stones is: #{pile.stones}"
        puts "Player #{self.name}, it is your turn now!"

        number = loop do
          number = gets.to_i
          if pile.has_enough_stones? number
            break number
          else
            puts "Please enter the correct number!"
          end
        end

        pile.take!(number)
      end
    end
  end
end