def do_something(&block)
  block.call
end

my_proc = proc { puts 'string...' }
do_something(&my_proc)