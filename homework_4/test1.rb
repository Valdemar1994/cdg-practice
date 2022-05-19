require 'pry'
require 'rspec'
require './task1.rb'

DATA_PATH = 'test1.txt'
ENV = 'test'

RSpec.describe 'Methods' do
  where_test = []
  where_test << "Иван Иванов 20\n"
   
  let(:file) {File.open(DATA_PATH)}
    
  it '#index' do
    expect{index}.to output(file.read).to_stdout
  end
    
  it '#find' do
    expect(find(1)).to eq("Сергей Сергеев 19\n")
  end
    
  it '#where' do
    expect(where('Иван')).to eq(where_test)
  end

  it '#update' do
    expect(update(0, 'Виталий Витальевич 23')).to eq(1)
    expect(file.read).to eq("Виталий Витальевич 23\nСергей Сергеев 19\nИван Иванов 20\n")
  end

  it '#delete' do
    expect(delete(2)).to eq(1)
    expect(file.read).to eq("Виталий Витальевич 23\nСергей Сергеев 19\n")
  end
end