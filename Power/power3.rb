def each_power(kinds,len,a=[],&block)
  if len == 0 then
    if block then
      block.call(a)
    end
  else
    kinds.times { |i|
      each_power(kinds,len-1,a+[i],&block)
    }
  end
end

each_power(4,2){ |p|
  puts p.join(',')
}


