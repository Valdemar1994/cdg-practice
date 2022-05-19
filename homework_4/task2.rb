require 'fileutils'
require 'pry'
require './test2'

def run
  loop do
    puts('If you want break application type (-1)')
    print('Type student age: ')
    age = gets.chomp
    students(age)
    break if age == '-1' || FileUtils.compare_file('students.txt','results.txt')
  end
end

def students(age)
  students = []
  result = []
  File.foreach('students.txt') {|line| students.push(line.chomp)}
    students.select {|student| result.push(student) if student.include?(age)}
    file = File.new('results.txt', 'a')
    result.each do |student|
      file.puts(student)
    end
    return "Add students at list: #{result}"
    file.close
end

if ENV != 'test'
  puts run
end
