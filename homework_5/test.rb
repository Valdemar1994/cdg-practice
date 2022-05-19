require 'pry'
require 'rspec'
require './task1'

ENV = 'test'

RSpec.describe 'CashMachine' do
  balance = 100.0

  it 'Deposit money to account' do
    allow_any_instance_of(Object).to receive(:gets).and_return(100)
    expect(CashMachine.new.bank_operation('d', balance).values.first).to eq(200.0)
  end

  it 'Take money from the account' do
    allow_any_instance_of(Object).to receive(:gets).and_return(50)
    expect(CashMachine.new.bank_operation('w', balance).values.first).to eq(50.0)
  end

  it 'Check user balance' do
    expect(CashMachine.new.bank_operation('b', balance).values.first).to eq(100.0)
  end

  it 'Incorrect input value for sum' do
    allow_any_instance_of(Object).to receive(:gets).and_return(-1)
    expect(CashMachine.new.bank_operation('d', balance).values.last).to eq('Error! Sum is negative or equal 0')
  end

  it 'Incorrect input value for difference' do
    allow_any_instance_of(Object).to receive(:gets).and_return(200)
    expect(CashMachine.new.bank_operation('w', balance).values.last).to eq('Error! Insufficient balance')
  end

  it 'Incorrect sumbol' do
    expect(CashMachine.new.bank_operation('asd', balance).values.last).to eq('Error! Type correct symbol')
  end

end