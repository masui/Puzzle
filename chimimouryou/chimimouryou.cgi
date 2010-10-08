#!/usr/bin/env ruby

$: << '/home/masui/Puzzle/chimimouryou'

require 'cgi'
require 'chimimouryou'

cgi = CGI.new('html3')

pat = cgi['pat'].to_s
len = pat.split(//).length
pat = 'òµÌ¥ò³ò´' if pat == '' || len < 2
size = cgi['size'].to_i
size = 12 if size == 0 || size > 40 || size <= len

(a,startx,starty) = chimimouryou(pat,size)

out = 
cgi.table {
  (0...size).to_a.collect { |y|
    cgi.tr('margin' => '0', 'padding' => '0'){
      (0...size).to_a.collect { |x|
        cgi.td('margin' => '0', 'padding' => '0') {
          cgi.font('size' => '5'){
#            if x == startx && y == starty then
            if false then
              cgi.a('href' => ''){
                cgi.font('color' => 'blue'){
                  a[y][x]
                }
              }
            else
              a[y][x]
            end
          }
        }
      }.join
    }
  }.join
}


cgi.out {
  cgi.html {
    cgi.head {
      cgi.meta('http-equiv' => "Content-Type", 'content' => "text/html; charset=euc-jp")
    } +
    cgi.body {
      cgi.form('method' => 'get', 'action' => 'chimimouryou.cgi'){
        'Text: ' +
        cgi.input('type' => 'text', 'name' => 'pat', 'value' => pat ){ } +
        '   ' +
        'Size: ' +
        cgi.input('type' => 'text', 'name' => 'size', 'size' => '10', 'value' => size.to_s ){ } +
        out + # + startx.to_s + "<br>" + starty.to_s
        cgi.input('type' => 'submit', 'value' => 'ºÆ·×»»')
      }
    }
  }
}

