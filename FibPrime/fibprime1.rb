#!/usr/bin/ruby
#
# 2, 3, 5, 13, 89, 233, 1597, 28657, 514229, 433494437, 2971215073, ...
#

IO.popen("./fib1.rb","r"){ |ffib|
  IO.popen("./prime1.rb","r"){ |fprime|
    fib = ffib.gets.to_i
    prime = fprime.gets.to_i
    while true do
      if fib == prime then
        puts fib
        fib = ffib.gets.to_i
        prime = fprime.gets.to_i
      elsif fib > prime then
        prime = fprime.gets.to_i
      else
        fib = ffib.gets.to_i
      end
    end
  }
}


