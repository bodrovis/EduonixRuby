family = {
    mother: 50,
    father: 55,
    sister: 20
}

puts 'Enter the member of the family:'
member = gets.strip.to_sym

puts(family.has_key?(member) ? "Age is: #{family[member]}" : "I don't know whom are you looking for...")

