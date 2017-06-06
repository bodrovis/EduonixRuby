arr = []
catch(:exit) do
  loop do
    input = gets.strip
    input == 'exit' ? throw(:exit) : arr << input.to_i
  end
end

puts arr.inspect