module GameOfStones
  module Models
    class Player
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def make_turn!(pile)
        puts "The current number of stones is: #{pile.stones}"
        puts "Player #{self.name}, it is your turn now!"

        take_stones_from pile
      end

      def lost
        puts "Player #{name} lost..."
      end

      def won
        puts "Player #{name} won!"
      end

      private

      def take_stones_from(pile)
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