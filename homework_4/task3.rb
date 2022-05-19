require 'pry'
require 'active_support/core_ext/enumerable'
require './test3'

def bank_run 
  if File.exist?('balance.txt')
    balance = File.read('balance.txt').to_f
  else
    File.new('balance.txt', 'w')
    balance = 100.0
  end

  loop do
    print 'Type what you want: D (deposit), W (withdraw), B (balance) or Q (quit):'
    action = gets.chomp
    balance = bank_operation(action, balance).values.first
  break if ['q','Q'].include?(action)
  end

  File.write('balance.txt', balance)
    
end

def bank_operation(action, balance)
  if ['d','D'].include?(action)
    puts "Your balance: #{balance}"
    print 'Enter the deposit amount: '
    sum = gets.to_f

    if 0 <= sum
      balance = balance + sum
      puts "Your balance now: #{balance}"
    else
      puts 'Error! Sum is negative or equal 0'
      error = 'Error! Sum is negative or equal 0'
    end

  elsif ['w','W'].include?(action)
    puts "Your balance: #{balance}"
    print 'Enter the withdraw amount: '
    sum = gets.to_f

      if sum <= balance && sum > 0
        balance = balance - sum
        puts "Your balance now: #{balance}"
      else
        puts 'Error! Insufficient balance'
        error = 'Error! Insufficient balance'
      end

  elsif ['b','B'].include?(action)
    puts "Your balance now: #{balance}"
  elsif %w[d D w W b B q Q].exclude?(action)
    puts 'Error! Type correct symbol'
    error = 'Error! Type correct symbol'
  end
  {balance: balance, error: error}
end

if ENV != 'test'
  puts bank_run
end