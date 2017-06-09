module GameOfStones
  class Game
    attr_reader :pile, :players, :loser

    def initialize
      welcoming_message
      @options = GameOfStones::GameOptions.new
      @players = GameOfStones::Collections::Players.new
      @pile = GameOfStones::Models::Pile.new(@options)
    end

    def start!
      @loser = players.make_turns_until(pile) { |current_pile| current_pile.empty? }
    end

    def render_statistics(ios = [:file, :terminal])
      say ["\nPlayer #{loser} lost!", players.info], ios
    end

    private

    def welcoming_message
      say [
              '*' * 29,
              'WELCOME TO THE GAME OF STONES',
              '*' * 29
          ]
    end
  end
end