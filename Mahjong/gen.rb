# -*- coding: utf-8 -*-
#
# 清一色のあらゆる配牌を出力
#

# n〜8 からpieces枚を選ぶ
def out(n,pieces,a)
  if n == 9 then
    if pieces == 0 then
      puts a.join(",")
    end
  else
    (0..4).each { |k|
      a[n] = k
      out(n+1,pieces-k,a)
    }
  end
end

out(0,14,[])
