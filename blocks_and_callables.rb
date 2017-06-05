def do_something_else(str, &block)
  yield(str)
end

def do_something(str, &block)
  do_something_else str, &block
end

do_something('some string') do |str|
  puts str
end