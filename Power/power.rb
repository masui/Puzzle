def power(kinds,len)
  power2(kinds,len,[])
end

def power2(kinds,len,a)
  if len == 0 then
    puts a.join(',')
  else
    kinds.times { |i|
      power2(kinds,len-1,a+[i])
    }
  end
end

power(8,8)
