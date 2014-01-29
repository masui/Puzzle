#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# 素数を生成してブロックを渡す
#
class Prime
  def self.calc
    primes = [2]
    puts 2
    cand = 3
    loop do
      lim = Math.sqrt(cand).floor
      primes.each { |prime|
        if prime > lim then
          yield cand
          primes << cand
          break
        end
        if cand % prime == 0 then
          break
        end
      }
      cand += 1
    end
  end
end

if $0 == __FILE__
  Prime.calc { |prime|
    puts prime
  }
end
