module Zoo
  class Animal
    include Comparable
    attr_accessor :name, :age

    def initialize(name, age = 0)
      @name = name
      @age = age
    end

    def <=>(other_animal)
      self.age <=> other_animal.age
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
end

buttons = Zoo::Cat.new 'buttons', 5
spot  = Zoo::Cat.new 'spot', 3
puts buttons < spot