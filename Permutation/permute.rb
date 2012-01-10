def permute( n)
  if n == 0 then
    yield []
  else
    permute(n-1) { |pat|
      n.times { |i|
        yield pat[0,i]+[n-1]+pat[i,n]
      }
    }
  end
end

permute(8) { |pat|
  puts pat.join(',')
}
