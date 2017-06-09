class Parent
  def some_method
    puts 'Hi from parent!'
  end
end

class Child < Parent
  def some_method
    puts 'Hi from child!'
  end

  def self.get_rid_of(method)
    remove_method method
  end
end

child = Child.new
Child.get_rid_of :some_method
child.some_method