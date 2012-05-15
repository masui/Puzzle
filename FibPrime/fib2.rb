#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# フィボナッチ数列を生成してブロックを渡す
#
class Fib
  def self.calc
    fib = [1,1]
    loop do
      yield fib[0]
      fib.push fib.shift + fib[0]
    end
  end
end

if $0 == __FILE__
  Fib.calc { |fib|
    puts fib
  }
end

