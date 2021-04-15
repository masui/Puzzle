if ARGV[0]
  n = ARGV[0].to_i
else
  n = 17
end

a = []

(1..n).each { |i|
  v = ('1'*i).to_i
  r = v % n
  if r == 0
    puts v
    exit
  end
  a[i] = r
  (1..i-1).each { |j|
    if a[j] == r
      puts v - ('1'*j).to_i
      exit
    end
  }
  
  #print i
  #print " "
  #print ('1'*i).to_i % n
  #print " "
  #puts v
}


