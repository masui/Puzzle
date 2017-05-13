def each_permute(n)
  if n == 0 then
    yield []
  else
    each_permute(n-1){ |pat|
      n.times { |i|
        yield pat[0,i]+[n-1]+pat[i,n]
      }
    }
  end
end

if $0 == __FILE__ then
  each_permute(4){ |pat|
    puts pat.join(',')
  }
end
