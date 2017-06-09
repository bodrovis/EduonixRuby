require 'yaml'
require 'slop'

require_relative 'game_of_stones/utils/hash'
require_relative 'game_of_stones/utils/printer'
require_relative 'game_of_stones/game_options'
require_relative 'game_of_stones/models/pile'
require_relative 'game_of_stones/models/player'
require_relative 'game_of_stones/collections/players'
require_relative 'game_of_stones/game'

module GameOfStones
  AVAILABLE_SETTINGS = [:stones, :max, :min]
  class << self
    def load_settings!
      const_set(:CONFIG, {})

      begin
        config_file = File.expand_path('../../config.yml', __FILE__)
        yaml_conf = YAML.load_file(config_file).symbolize_keys

        AVAILABLE_SETTINGS.each do |setting|
          value = yaml_conf.fetch(setting) do
            raise KeyError, "No value for the setting #{setting} is specified!"
          end.to_i

          CONFIG[setting] = value
        end
      rescue KeyError => e
        say e.message, :abort
      rescue Errno::ENOENT
        say "No configuration file found!", :abort
      end
    end
  end

  GameOfStones.load_settings!
end