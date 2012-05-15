#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
# 素数をひたすら出力
#
primes = [2]
puts 2
cand = 3
while true do
  lim = Math.sqrt(cand).floor
  primes.each { |prime|
    if prime > lim then
      puts cand
      primes << cand
      break
    end
    if cand % prime == 0 then
      break
    end
  }
  cand += 1
end

