#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# 素数かつフィボナッチ数を生成
#
# 2, 3, 5, 13, 89, 233, 1597, 28657, 514229, 433494437, 2971215073, ...
#

require 'Monitor'
lock = Monitor.new

require 'fib2'
require 'prime2'

h = {}

fib_thread = Thread.new do
  Fib.calc { |fib|
    if h[fib] == 'p' then
      puts fib
    end
    lock.synchronize do
      h[fib] = 'f'
    end
  }
end

prime_thread = Thread.new do
  Prime.calc { |prime|
    if h[prime] == 'f' then
      puts prime
    end
    lock.synchronize do
      h[prime] = 'p'
    end
  }
end

fib_thread.join
prime_thread.join




