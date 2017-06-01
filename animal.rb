class Animal
  @@type = :cat
  attr_accessor :name, :age

  def initialize(name, age = 0)
    @name = name
    @age = age
  end

  def get_older!
    @age += 1
  end

  def Animal.change_type!(new_type)
    @@type = new_type
  end

  def type
    @@type
  end
end

spot = Animal.new 'spot', 5
buttons = Animal.new 'buttons'
Animal.change_type! :dog
puts spot.type
# ===========
puts "Button's type: #{buttons.type}"
#spot.get_older!
#puts spot.age
# spot.name = 'new name...'
# puts spot.name
#
# buttons = Animal.new 'buttons'
# puts buttons.name