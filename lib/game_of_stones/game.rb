module GameOfStones
  class Game
    attr_reader :pile, :players, :loser

    def initialize
      welcoming_message
      @players = GameOfStones::Collections::Players.new
      @pile = GameOfStones::Models::Pile.new
    end

    def start!
      @loser = players.make_turns_until(pile) { |current_pile| current_pile.empty? }
    end

    def render_statistics(ios = [:file, :terminal])
      GameOfStones::Utils::Printer.print ["\nPlayer #{loser} lost!", players.info], ios
    end

    private

    def welcoming_message
      GameOfStones::Utils::Printer.print [
                                             '*' * 29,
                                             'WELCOME TO THE GAME OF STONES',
                                             '*' * 29
                                         ]
    end
  end
end