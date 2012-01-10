# -*- coding: utf-8 -*-
require 'permute2'

def conflict_queens?(pat)
  n = pat.length
  h = {}
  n.times { |i|
    return true if h[i - pat[i]]
    h[i - pat[i]] = true
  }
  h = {}
  n.times { |i|
    return true if h[i + pat[i]]
    h[i + pat[i]] = true
  }
  false
end

each_permute(8) { |queens|
  puts queens.join(',') unless conflict_queens?(queens)
}
