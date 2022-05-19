require 'pry'
require 'rspec'
require './task3'

ENV = 'test'

RSpec.describe 'Bank work' do
  balance = 100

  it "Deposit money to account" do
    allow_any_instance_of(Object).to receive(:gets).and_return(100)
    expect(bank_operation('d', balance).values.first).to eq(200.0)
  end

  it "Take money from the account" do
    allow_any_instance_of(Object).to receive(:gets).and_return(50)
    expect(bank_operation('w', balance).values.first).to eq(50.0)
  end

  it "Check user balance" do
    expect(bank_operation('b', balance).values.first).to eq(100.0)
  end

  it "Incorrect input value for sum" do
    allow_any_instance_of(Object).to receive(:gets).and_return(-1)
    expect(bank_operation('d', balance).values.last).to eq('Error! Sum is negative or equal 0')
  end

  it "Incorrect input value for difference" do
    allow_any_instance_of(Object).to receive(:gets).and_return(200)
    expect(bank_operation('w', balance).values.last).to eq('Error! Insufficient balance')
  end

  it "Incorrect sumbol" do
    expect(bank_operation('asd', balance).values.last).to eq('Error! Type correct symbol')
  end

end