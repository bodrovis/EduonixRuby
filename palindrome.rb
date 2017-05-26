def palindrome?(string)
  normalized_string = string.gsub(/\W/, '').downcase
  return normalized_string == normalized_string.reverse
end

puts palindrome?("Madam, I'm Adam!")