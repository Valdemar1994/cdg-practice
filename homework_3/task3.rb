#Word task

def words(word)
    if word[-2..-1].include?("CD")
    "2 to the power of the length of entered word word = #{2**word.length}"
    else
    "Reversed word = #{word.reverse}"
    end
end

print ("Type word = ")
word = gets.chomp

puts words(word)

#Pokemon task

def pokemon(number)
    pokemon_array = []
    while 0 < number do
        print ("Type pokemon name = ")
        name = gets.chomp
        print ("Type pokemon color = ")
        color = gets.chomp
        puts (" ")
        pokemon_array << {name: name, color: color}
        number -= 1
    end
    puts "Pokemon collection:"
    return pokemon_array
end

print ("How many pokemon do you want to create? ")
number = gets.to_i

puts pokemon(number)
