module Utils
  def format_name(name)
    name.strip.capitalize
  end
end

module AnimalUtils
  def change_type!
    puts 'changing type...'
  end
end

class Human
  include Utils
end

module Zoo
  class Animal
    include Utils
    extend AnimalUtils
    attr_accessor :name, :age

    def initialize(name, age = 0)
      @name = format_name name
      @age = age
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
puts buttons.name