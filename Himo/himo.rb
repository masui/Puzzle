# $B%T!<%?!<%U%i%s%/%k$N;;?tLdBj(B p10, $BLd(B4
# Generate & Test$BK!!#$+$J$j8zN($,0-$$!#(B
# 2004/8/25

def permute(a, prefix)
  if a.length == 0 then
    check(prefix)
  else
    a.each { |v|
      b = a.clone
      b.delete(v)
      permute(b,prefix+[v])
    }
  end
end

def check(a)
  ok = true
  npairs = a.length / 2
  (0..npairs-2).each { |i1|
    pair1 = a[i1*2,2]
    if pair1[0] > pair1[1] then
      ok = false
      next
    end
#    p pair1
    (i1+1..npairs-1).each { |i2|
      pair2 = a[i2*2,2]
      if pair1[0] > pair2[0] then
        ok = false
        next
      end
      if pair2[0] > pair2[1] then
        ok = false
        next
      end
#      p pair2
      if !check2(pair1,pair2) then
        ok = false
      end
    }
  }
  if ok then
    puts a.join(" ")
  end
end

def check2(pair1,pair2) # $BI3$N=E$J$j$NH=Dj(B
  (pair1[1] < pair2[0]) ||
  (pair1[0] > pair2[1]) ||
  (pair1[0] < pair2[0] && pair1[1] > pair2[1]) ||
  (pair1[0] > pair2[0] && pair1[1] < pair2[1])
end

permute([1,2,3,4,5,6,7,8],[])
