class InputError < StandardError
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def to_s
    "input string cannot be empty"
  end
end

raise InputError.new('some data') if gets.strip.length.zero?
puts 'some code goes here...'

