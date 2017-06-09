module GameOfStones
  module Utils
    module Printer
      def self.print(messages, ios)
        ios.each do |io|
          case io
            when :terminal
              to $stdout, messages
            when :file
              to File.new(name_with_timestamp, 'a'), messages, true
            when :warning
              to $stderr, messages
            when :abort
              to $stderr, messages
              exit
            else
              $stderr.puts 'Unknown IO!'
          end
        end
      end

      def self.to(io, messages, close = false)
        begin
          io.puts messages
        rescue => e
          to $stderr, e
        ensure
          io.close if close
        end
      end

      private

      def self.name_with_timestamp
        "game_of_stones-#{Time.now.hash}.txt"
      end
    end
  end
end

module Kernel
  def say(messages = [], ios = :terminal)
    ios = [ios] unless ios.kind_of? Enumerable
    GameOfStones::Utils::Printer.print messages, ios
  end
end