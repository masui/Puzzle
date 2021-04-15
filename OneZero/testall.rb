n = 12345
i = 1
while true do
  v = i.to_s(2).to_i
  if v % n == 0
    puts "#{n} * #{v/n} = #{v}"
    exit
  end
  i += 1
end


