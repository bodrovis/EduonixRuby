module GameOfStones
  class GameOptions
    def initialize(argv)
      parse_args(argv).tap {|options| check_options! options }.each do |option, value|
        self.class.class_exec do
          attr_reader option
        end

        self.instance_variable_set "@#{option}", value
      end
    end

    private

    def parse_args(argv)
      return defaults if argv.empty?

      begin
        options = Slop::Options.new do |o|
          o.integer '-s', '--stones', 'number of stones in the pile'
          o.integer '-i', '--min', 'minimum number of stones to take'
          o.integer '-a', '--max', 'maximum number of stones to take'
          o.on '--help' do
            say o, :abort
          end
        end

        parser = Slop::Parser.new(options)

        parser.parse(argv).to_hash.merge(defaults) {|k, v1, v2| v1 || v2 }
      rescue Slop::UnknownOption
        say "Unknown option", :warning
        say options, :abort
      end
    end

    def defaults
      CONFIG
    end

    def check_options!(options)
      if options.any? {|k,v| v < 1} || options[:min] > options[:stones] ||
          options[:max] > options[:stones] || options[:min] >= options[:max]
        say "Incorrect settings!", :abort
      end
    end
  end
end