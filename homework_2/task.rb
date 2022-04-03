#First method

def greeting(firstname, secondname, age)
    if age < 18
        "#{firstname} #{secondname} you are under 18 
but it is not never too early start learning programming!".gsub("\n","") 
    else
        "#{firstname} #{secondname} let's work together!"
    end
end

#Second method

def foobar(a,b)
    if a == 20
        "second number = #{b}"
    elsif b == 20
        "first number = #{a}"
    else
        "summ = #{a + b}"
    end
end

print 'Firstname > '
firstname = gets.chomp
print 'Secondname > '
secondname = gets.chomp
print 'age > '
age = gets.to_i 

puts greeting(firstname, secondname, age)

print "first number = "
a = gets.to_i
print "second number = "
b = gets.to_i

puts foobar(a,b)
