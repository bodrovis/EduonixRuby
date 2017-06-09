class Parent
  def self.parent_method
    puts 'Hi from parent!'
  end
end

class Child < Parent
  class << self
    def my_sample_method
      puts 'hi from child!'
    end
  end
end

child_eigenclass = Child.singleton_class
puts child_eigenclass.superclass
Child.my_sample_method