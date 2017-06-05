def output_fancy(str)
  formatted_string = block_given? ? yield(str) : str
  puts formatted_string.center(70, '=')
  puts 'other line of code from method...'
end

output_fancy(gets) { |str| str.strip.upcase }