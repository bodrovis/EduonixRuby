module GameOfStones
  class GameOptions
    def initialize
      CONFIG.tap {|options| check_options! options }.each do |option, value|
        self.class.class_exec do
          attr_reader option
        end

        self.instance_variable_set "@#{option}", value
      end
    end

    private

    def check_options!(options)
      if options.any? {|k,v| v < 1} || options[:min_take] > options[:stones] ||
          options[:max_take] > options[:stones] || options[:min_take] >= options[:max_take]
        say "Incorrect settings!", :abort
      end
    end
  end
end