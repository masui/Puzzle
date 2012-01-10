# -*- coding: utf-8 -*-
def hanoi(n,from=1,to=2,other=3)
  if n > 0 then
    hanoi(n-1,from,other,to)
    puts "板#{n}を#{from}から#{to}に移動"
    hanoi(n-1,other,to,from)
  end
end

hanoi(5)


