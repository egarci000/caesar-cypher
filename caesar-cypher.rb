$alphabet_in_arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r","s", "t", "u", "v", "w", "x", "y", "z"]

def get_caesar_cypher(phrase, shift_factor)
  new_phrase = phrase.chars.map do |char|
    if $alphabet_in_arr.include?(char.downcase)
      if(($alphabet_in_arr.index(char.downcase) + 1) + shift_factor > 26)
        calc_expression = shift_factor - (26 + (26 - ($alphabet_in_arr.index(char.downcase) + 1) + 1))
        new_char = $alphabet_in_arr.at(calc_expression)
        char.upcase == char ? char = new_char.upcase : char = new_char
      else
        new_char = $alphabet_in_arr.at($alphabet_in_arr.index(char.downcase) + shift_factor)
        char.upcase == char ? char = new_char.upcase : char = new_char
      end
    else
      char = char
    end
  end
  return new_phrase.join("")
end


request = "Please enter the phrase you'd like to encrypt, followed by the shift factor:"
puts request

user_string = gets.chomp.to_s
user_shift = gets.chomp.to_i

p get_caesar_cypher(user_string, user_shift)
