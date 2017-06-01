module GameOfStones
  class Game
    attr_reader :pile, :players

    def initialize
      welcoming_message
      @players = initialize_players
      @pile = GameOfStones::Models::Pile.new
    end

    def start!
      players.cycle do |player|
        player.make_turn!(pile)

        if pile.empty?
          player.lost
          break
        end
      end
    end

    private

    def initialize_players
      2.times.map do |i|
        puts "Player #{i + 1}, please enter your name:"
        GameOfStones::Models::Player.new(gets.strip)
      end
    end

    def welcoming_message
      puts '*' * 29
      puts "WELCOME TO THE GAME OF STONES"
      puts '*' * 29
    end
  end
end