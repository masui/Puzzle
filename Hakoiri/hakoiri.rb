# -*- coding: utf-8 -*-
pats = [
        [/220(..)221/, "022\\1122"],
        [/022(..)122/, "220\\1221"],
        [/01(...)22(...)22/, "22\\122\\201"],
        [/22(...)22(...)01/, "01\\122\\222"],
        [/30(...)41/, "03\\114"],
        [/03(...)14/, "30\\141"],
        [/0(....)3(....)4/, "3\\14\\20"],
        [/1(....)3(....)4/, "3\\14\\21"],
        [/3(....)4(....)0/, "0\\13\\24"],
        [/3(....)4(....)1/, "1\\13\\24"],
        [/55([01])/, "\\155"],
        [/([01])55/, "55\\1"],
        [/01(...)55/, "55\\101"],
        [/55(...)01/, "01\\155"],
        [/60/, "06"],
        [/61/, "16"],
        [/06/, "60"],
        [/16/, "61"],
        [/0(....)6/, "6\\10"],
        [/1(....)6/, "6\\11"],
        [/6(....)0/, "0\\16"],
        [/6(....)1/, "1\\16"],
       ]

s = "3223*4224*6666*3553*4014";
s = "3223*4224*3553*4664*6016";

strstate = {}
statestr = {}

states = 0
statestr[states] = s
strstate[s] = states
states += 1

def output(s)
  s.gsub!(/0/,'　')
  s.gsub!(/1/,'　')
  s.gsub!(/2/,'娘')
  s.gsub!(/3/,'父')
  s.gsub!(/4/,'親')
  s.gsub!(/6/,'小')
  s.gsub!(/55/,'番頭')
  puts "======"
  puts s.gsub(/\*/,"\n")
end

prev = {}
i = 0
while i < states do
  s = statestr[i]
  pats.each { |pair|
    pat = pair[0]
    replace = pair[1]
    if pat.match(s) then
      ss = s.dup
      ss.sub!(pat,replace)
      ss.sub!(/([01])(.*)([01])/, "0\\21")
      if strstate[ss].nil? then
        prev[states] = i
        statestr[states] = ss
        strstate[ss] = states
        if /22.$/.match(ss) then
          STDERR.puts states
          while prev[states] do
            output(statestr[states])
            states = prev[states]
          end
          output(statestr[states])
          exit
        end
        states += 1
        STDERR.puts states if states % 1000 == 0
      end
    end
  }
  i += 1
end

		



