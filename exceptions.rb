class InputError < StandardError
  attr_reader :allow_retry
  def initialize(allow_retry = false)
    @allow_retry = allow_retry
  end

  def to_s
    "input string cannot be empty"
  end
end

begin
  raise InputError.new if gets.strip.length.zero?
rescue InputError => e
  puts e
  retry if e.allow_retry
rescue ZeroDivisionError
  puts 'divided by zero!'
else
  puts 'i am being called if an error WAS NOT raised'
ensure
  puts 'i am being called at any condition!'
end
puts 'some code goes here...'

