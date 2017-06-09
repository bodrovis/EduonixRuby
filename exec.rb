class Sample
  def initialize(some_attribute)
    @some_attribute = some_attribute
  end
end

Sample.class_exec do
  def my_method
    puts 'hello!'
  end
end

sample = Sample.new 'some value'
#sample.my_method

sample.instance_exec do
  puts @some_attribute
end