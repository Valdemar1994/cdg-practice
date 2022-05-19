require 'pry'

STUDENTS = 'test1.txt'

# выводит все строки
def index
  File.foreach(STUDENTS) {|student| puts student}
end

# находит конкретную строку в файле и выводит ее
def find(id)
  File.foreach(STUDENTS).with_index do |student, index|
    @student_line = student if index == id
  end
  @student_line
end

# находит все строки, где есть указанный паттерн
def where(pattern)
  student_array = []
  File.foreach(STUDENTS).with_index do |student, index|
    student_array << student if student.include?(pattern)
  end
  puts ("All lines including pattern (#{pattern}): ")
  student_array
end

# обновляет конкретную строку файла
def update(id, text)
  file = File.new('BUFFER.txt', 'w')
  File.foreach(STUDENTS).with_index do |student, index|
    file.puts(id == index ? text : student)
  end
  file.close
  File.write(STUDENTS, File.read('BUFFER.txt'))
  File.delete('BUFFER.txt') if File.exist?('BUFFER.txt')
end

# удаляет строку
def delete(id)
  file = File.new('BUFFER.txt', 'w')
  File.foreach(STUDENTS).with_index do |student, index|
    file.puts student if index != id
  end
    file.close
  File.write(STUDENTS, File.read('BUFFER.txt'))
  File.delete('BUFFER.txt') if File.exist?('BUFFER.txt')
end

puts index
puts find(2)
puts where('Иван')
puts update(0, 'Валерий Штирлиц 25')
puts delete(0)