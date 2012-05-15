#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# フィボナッチ数列を出力
#
fib = [1,1]
loop do
  puts fib[0]
  fib.push fib.shift + fib[0]
end

