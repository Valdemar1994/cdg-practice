require 'socket'
require 'cgi'
require 'uri'
require 'pry'
require './test'

class CashMachine
  def calculation(balance, summa, method)
    if (summa < 0) && method == '/deposit'
      message = 'Error! Deposit value is negative or equal to 0'
      status = 400
    elsif (summa > 0) && method == '/deposit'
      balance += summa
      message = "Balance = #{balance}"
      status = 200
    elsif (summa > balance) && method == '/withdraw'
      message = 'You dont have enough money on your account'
      status = 400
    elsif (summa <= balance) && method == '/withdraw'
      balance -= summa
      message = "Balance = #{balance}"
      status = 200
    elsif method == '/balance'
      message = "You balance now = #{balance}"
      status = 200
    else
      message = 'Hello. Type your choise after 0.0.0.0:3000/deposit?value= | withdraw?value= | balance'
      status = 200
    end

    {
      balance: balance,
      message: message,
      status:  status,
    }
  end
end

class App
  def server
    server = TCPServer.new('0.0.0.0', 3000)
    cash_machine = CashMachine.new
    balance = 100

    while connection = server.accept
      request = connection.gets
      method, path = request.split(' ')

      pp method
      pp path

      uri = URI(path)
      params = CGI::parse(uri.query || "")
      summa = params['value'].first.to_i

      result = cash_machine.calculation(balance, summa, uri.path)
      balance = result[:balance]

      connection.print "HTTP/1.1 #{result[:status]}\r\n"
      connection.print "Content-Type: text/html\r\n"
      connection.print "\r\n"
      connection.print result[:message]

      connection.close
      balance
    end
  end
end

App.new.server if ENV != 'test'
