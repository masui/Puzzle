def power(kinds,len,a=[])
  if len == 0 then
    puts a.join(',')
  else
    kinds.times { |i|
      power(kinds,len-1,a+[i])
    }
  end
end
power(4,2)

