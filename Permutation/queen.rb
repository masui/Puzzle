def each_permute( n)
  if n == 0 then
    yield []
  else
    each_permute(n-1) { |pat|
      n.times { |i|
        yield pat[0,i]+[n-1]+pat[i,n]
      }
    }
  end
end

def no_conflict_queens?(pat)
  n = pat.length
  h = {}
  n.times { |i|
    return false if h[i - pat[i]]
    h[i - pat[i]] = true
  }
  h = {}
  n.times { |i|
    return false if h[i + pat[i]]
    h[i + pat[i]] = true
  }
  true
end

each_permute(8) { |pat|
  puts pat.join(',') if no_conflict_queens?(pat)
}
