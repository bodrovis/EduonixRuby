module GameOfStones
  module Collections
    class Players
      include Enumerable
      attr_reader :list

      def initialize
        @list = players_from_input
      end

      def each
        list.each {|player| yield(player) }
      end

      def make_turns_until(pile)
        list.cycle do |player|
          player.make_turn(pile)

          break(player) if yield(pile)
        end
      end

      def info
        list.map {|player| player.info }.join
      end

      private

      def players_from_input
        2.times.map do |i|
          begin
            puts "Player #{i + 1}, please enter your name:"
            GameOfStones::Models::Player.new(gets)
          rescue GameOfStones::Models::Player::IncorrectName => e
            puts e.message
            retry
          end
        end
      end
    end
  end
end