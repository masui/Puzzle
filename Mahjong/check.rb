# -*- coding: utf-8 -*-
#
# 清一色がアガっているかチェックする
#
# 入力は 4,2,3,2,1,0,0,2,0 みたいな形式
# 一万が4枚、二万が2枚、...
# gen.rbにより生成される
#

def mindex(a) # 一番数が小さな牌
  a.each_with_index { |v,i|
    return i if v > 0
  }
  return -1
end

def agari?(a)
  chitoi = true
  9.times { |i|
    if a[i] != 0 and a[i] != 2 then
      chitoi = false
    end
  }
  return true if chitoi
  9.times { |atama|
    if a[atama] >= 2 then
      a[atama] -= 2
      res = agari2?(a)
      a[atama] += 2
      return true if res
    end
  }
  return false;
end

def agari2?(a)
  i = mindex(a)
  return true if i < 0
  if a[i] >= 3 then 
    a[i] -= 3
    res = agari2?(a)
    a[i] += 3
    return true if res
  end
  if i+2 <= 8 and a[i] > 0 and a[i+1] > 0 and a[i+2] > 0 then
    a[i] -= 1
    a[i+1] -= 1
    a[i+2] -= 1
    res = agari2?(a)
    a[i] += 1
    a[i+1] += 1
    a[i+2] += 1
    return true if res
  end
  return false
end

ARGF.each { |line|
  a = line.chomp.split(/,/).map { |i| i.to_i }
  puts a.join(",") + " " + (agari?(a) ? "o" : "x")
}
