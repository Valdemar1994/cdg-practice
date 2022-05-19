require 'pry'
require 'rspec'
require './server'

ENV = 'test'

RSpec.describe 'Server with CashMashine' do
  balance = 100
  it 'Deposit money' do
    expect(CashMachine.new.calculation(balance, 100, '/deposit').values.first).to eq(200.0)
  end

  it 'Take money' do
    expect(CashMachine.new.calculation(balance, 50, '/withdraw').values.first).to eq(50.0)
  end

  it "Balance amount" do
    expect(CashMachine.new.calculation(balance, 0, '/balance').values.first).to eq(100)
  end

  it "Check message user balance" do
    expect(CashMachine.new.calculation(balance, 0, '/balance').values[1]).to eq("You 
balance now = #{balance}".gsub("\n",''))
  end

  it "Incorrect input value for sum" do
    expect(CashMachine.new.calculation(balance, -150, '/deposit').values[1]).to eq('Error! 
Deposit value is negative or equal to 0'.gsub("\n",''))
  end

  it "Incorrect input value for difference" do
    expect(CashMachine.new.calculation(balance, 200, '/withdraw').values[1]).to eq('You dont 
have enough money on your account'.gsub("\n",''))
  end

  it "Start page with random requestion" do
    expect(CashMachine.new.calculation(balance, 0, '/hello').values[1]).to eq('Hello. 
Type your choise after 0.0.0.0:3000/ deposit?value= | withdraw?value= | balance'.gsub("\n",''))
  end

  it 'Request status 1' do
    expect(CashMachine.new.calculation(balance, 100, '/deposit').values[2]).to eq(200)
  end

  it 'Request status 2' do
    expect(CashMachine.new.calculation(balance, 50, '/withdraw').values[2]).to eq(200)
  end

  it 'Request status 3' do
    expect(CashMachine.new.calculation(balance, 0, '/balance').values[2]).to eq(200)
  end

  it 'Request status 4' do
    expect(CashMachine.new.calculation(balance, -150, '/deposit').values[2]).to eq(400)
  end

  it 'Request status 5' do
    expect(CashMachine.new.calculation(balance, 200, '/withdraw').values[2]).to eq(400)
  end
end