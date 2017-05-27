new_arr = %w(apple banana cherry).map.with_index  do |element, index|
  "Element #{index + 1}: #{element}"
end
# Element 1: apple
puts new_arr.inspect