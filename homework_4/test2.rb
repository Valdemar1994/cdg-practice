require 'pry'
require 'rspec'
require './task2'

ENV = 'test'

RSpec.describe 'Students sorting application' do
  
  it 'The first step of adding a student to the list' do
    expect(students('19')).to eq("Add students at list: [\"Тимур Тимуров 19\", \"Тимофей Тимофеев 19\", 
\"Сергей Сергеев 19\"]".gsub("\n",''))
  end

  it 'The second step of adding a student to the list' do
    expect(students('20')).to eq("Add students at list: [\"Иван Иванов 20\", \"Антон Антонов 20\", 
\"Вадим Вадимов 20\", \"Олег Олегов 20\", \"Арман Арманов 20\"]".gsub("\n",''))
  end

  it 'The first step of adding a student to the list' do
    expect(students('21')).to eq("Add students at list: [\"Алексей Алексеев 21\", \"Петр Петров 21\"]")
  end
end
