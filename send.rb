class Animal
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end

  private

  def secret
    'something secret is going on here...'
  end
end

animal = Animal.new('Buttons', 4)
puts 'What would you like to learn about this animal?'
method = gets.strip.to_sym

if [:name, :age].include?(method)
  puts animal.send(method)
end
