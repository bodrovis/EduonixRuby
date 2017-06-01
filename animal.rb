class Animal
  def say(word1:, word2: 'default value', hash: {})
    puts word1
    puts hash.inspect
    puts word2
  end
end

new_animal = Animal.new
new_animal.say word1: 'word1', hash: {key: 'value', key2: 5}