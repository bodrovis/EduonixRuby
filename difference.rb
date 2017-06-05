# addition = ->(a,b) { a + b }
# puts addition.call(4) # argument error!

# addition = proc {|a,b| a + b.to_i }
# puts addition.call(4,5,100,4,4,4) # no argument error!

# ================

def test_difference#(callable_object)
  my_proc = proc do
    puts 'doing code from proc...'
    return
  end
  my_proc.call
  puts 'doing something else...'
end

# my_lambda = -> do
#   puts 'doing code from lambda...'
#   return
# end
#
# test_difference my_lambda


test_difference# my_proc