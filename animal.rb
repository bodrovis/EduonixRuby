class Animal
  def initialize(name)
    puts "animal #{name} is born!"
  end

  def Animal.walk
    puts 'I am walking...'
  end

  def say(phrase = '')
    return if phrase.empty?
    "I am saying: #{format phrase}"
  end

  def with_object(another_object)
    another_object.format 'test'
  end

  #private
  protected

  def format(string)
    string.upcase
  end

  #protected :format, :with_object, :say
end

#Animal.walk
new_animal = Animal.new 'some name'
new_animal.walk
# another_animal = Animal.new 'another name'
# puts new_animal.with_object another_animal
# #puts new_animal.say 'hello!'
# puts new_animal.format 'test'