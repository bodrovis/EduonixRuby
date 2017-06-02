class Animal
  attr_accessor :name, :age

  def initialize(name, age = 0)
    @name = name
    @age = age
  end

  def self.change_type!

  end
  def info
    "Name: #{self.name}, age: #{age}"
  end

  def say
    'Generic saying...'
  end

  def walk_to(somewhere)
    puts "[PARENT] Walking to #{somewhere}"
  end
end

class Cat < Animal
  def walk_to(somewhere)
    puts "[CHILD] Walking to #{somewhere}"
    super(somewhere)
  end
  def say
    'meow'
  end
end

class Dog < Animal
  def say
    'woof'
  end
end

buttons = Cat.new 'buttons', 5
puts buttons.info


puts buttons.class. # => Cat
superclass. # => Animal
superclass. # => Object
superclass. # => BasicObject
superclass.inspect # => nil

#puts buttons.walk_to 'far away'