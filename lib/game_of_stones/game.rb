module GameOfStones
  class Game
    attr_reader :pile, :players

    def initialize
      welcoming_message
      @players = GameOfStones::Collections::Players.new
      @pile = GameOfStones::Models::Pile.new
    end

    def start!
      loser = players.make_turns_until(pile) { |current_pile| current_pile.empty? }
      puts "\nPlayer #{loser.name} lost..."
      puts players.info
    end

    private

    def welcoming_message
      puts '*' * 29
      puts 'WELCOME TO THE GAME OF STONES'
      puts '*' * 29
    end
  end
end