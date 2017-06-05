def do_something(a, b)
  yield a.to_i, b.to_i
end

#puts do_something('4','5') { |a,b| a + b }
#puts do_something('4','5', &:+)

#puts [1,2,3].reduce(0) { |element, result| result + element }
puts [1,2,3].reduce(gets.strip.to_sym)