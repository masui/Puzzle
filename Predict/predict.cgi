#!/usr/local/bin/ruby

require 'cgi'
require 'sdbm'
require 'predict'

cgi = CGI.new('html3')
p = Predict.new(4)
p.tokens = ('1'..'4').to_a

history = cgi['history'].to_s
sel = cgi['sel'].to_s
(0...history.length).each { |i|
  p.add(history[i,1])
}
n = p.predict
c = n[rand(n.length)]
c = n[0]
newhist = history + sel

highscore = -1
topperson = ''
db = SDBM.open('score')
if db then
  db.each { |name, score|
    score = score.to_i
    if score > highscore then
      topperson = name
      highscore = score
    end
  }
end

#def button(n,history)
#  <<EOF
#<form action='predict.cgi' method='post'>
#<input type='hidden' name='history' value=#{history}>
#<input type='hidden' name='sel' value=#{n}>
#<input type=submit value=#{n}>
#</form>
#EOF
#end

def button(history='')
  <<EOF
<center>
<a href="predict.cgi?history=#{history}&sel=1" accesskey=1>1</a>
<a href="predict.cgi?history=#{history}&sel=2" accesskey=2>2</a>
<a href="predict.cgi?history=#{history}&sel=3" accesskey=3>3</a>
<a href="predict.cgi?history=#{history}&sel=4" accesskey=4>4</a>
</center>
EOF
end

def showhist(history)
  <<EOF
履歴=#{history}
EOF
end

def first(highscore,topperson)
  <<EOF
システムの予測をどれだけ出し抜けるかに挑戦するゲームです。
<br>
システムの予想と異なる数字を選ぶと得点が得られます。
<br>
(数字キー入力もできます)
<br>
最高得点は#{highscore}点 (#{topperson}さん)です。
<br>
最初の数字を選んで下さい:
#{button}
<a href="description.html">詳しくはこちら</a>
EOF
end

def second(history)
  <<EOF
システムの予測と異なると思われる数字を選んで下さい:<br>
#{button(history)}
#{showhist(history)}
EOF
end

def success(history,n,sel)
  <<EOF
<center>得点: #{history.length}</center>
(システムの予測 = #{n[0]} / 入力 = #{sel})<br>
#{second(history)}
EOF
end

def fail(history,sel)
  <<EOF
<center>得点: <b>#{history.length}</b></center>
システムの予測と入力が一致しました。[#{sel}]<br>
#{showhist(history)}
<br>
<a href="predict.cgi">もう一度挑戦</a>
EOF
end

def high(history,sel,highscore)
  <<EOF
<center>得点: <b>#{history.length}</b></center>
システムの予測と入力が一致しました。[#{sel}]<br>
#{showhist(history)}
<br>
ハイスコアです! <a href="register.cgi?score=#{highscore}">名前を登録</a>
<br>
<a href="predict.cgi">もう一度挑戦</a>
EOF
end

def script(history)
  <<EOF
<SCRIPT LANGUAGE="JavaScript">
<!--
document.onkeypress = keypress;
function keypress(event)
{
	var i = keycode(event);
	if(i == 0x30){
		window.location.href="predict.cgi"
	}
	if(i == 0x31){
		window.location.href="predict.cgi?history=#{history}&sel=1"
	}
	if(i == 0x32){
		window.location.href="predict.cgi?history=#{history}&sel=2"
	}
	if(i == 0x33){
		window.location.href="predict.cgi?history=#{history}&sel=3"
	}
	if(i == 0x34){
		window.location.href="predict.cgi?history=#{history}&sel=4"
	}
}
function keycode(event)
{
	if(navigator.appName.indexOf("Microsoft") != -1)
		return window.event.keyCode;
	if(navigator.appName.indexOf("Netscape") != -1)
		return event.which;
}

//-->
</SCRIPT>
EOF
end

body =
  if history == '' then
    if sel == '' then
      first(highscore,topperson)
     else
       second(newhist)
     end
   else
     if c == sel then
       oldhist = history
       history = ''
       newhist = ''
       if oldhist.length > highscore then
         high(oldhist,sel,oldhist.length)
       else
         fail(oldhist,sel)
       end
     else
       success(newhist,n,sel)
     end
   end

cgi.out {
  cgi.html {
    cgi.head {
      script(newhist)
    } +
    cgi.body {
      body
    }
  }
}

