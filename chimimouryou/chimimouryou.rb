#!/usr/bin/env ruby

require 'kconv'
$KCODE = 'euc-jp'

def chimimouryou(pat,size)
  d = pat.split(//)
  len = d.length

  #
  # ランダムに文字を用意
  #
  a =
     (0...size).collect { |y|
    (0...size).collect { |x|
      d[rand(len)]
    }
  }
  
  #
  # 正しい文字列がどこかにないかを検索し、みつかれば乱数を計算しなおす。
  # その後、正しい文字列を埋め込んで、それがユニークであることを確認する。
  # 滅茶苦茶な方式だがまぁ大丈夫
  #
  
  count = 0
  while count != 1 do
    # puts "----------------"
    count = 0
    done = true
    #
    # 文字列にマッチするか検索。あればランダムに置換。
    #
    (0...size).each { |y|
      (0..size-len).each { |x|
        s = (0...len).collect { |i| a[y][x+i] }.join
        if s == pat then
          count = -1
          (0..3).each { |i|
            a[y][x+i] = d[rand(len)]
          }
        end
      }
    }
    (0...size).each { |x|
      (0..size-len).each { |y|
        s = (0...len).collect { |i| a[y+i][x] }.join
        if s == pat then
          count = -1
          (0...len).each { |i|
            a[y+i][x] = d[rand(len)]
          }
        end
      }
    }
    if count == 0 then
      #
      # ランダムな場所に正しい文字列を埋め込む
      #
      startx = rand(size-len+1)
      starty = rand(size-len+1)
      
      if rand(2) == 0 then
        (0...len).each { |i|
          a[starty][startx+i] = d[i]
        }
      else
        (0...len).each { |i|
          a[starty+i][startx] = d[i]
        }
      end
      #
      # ユニークかどうか検証
      #
      (0...size).each { |y|
        (0..size-len).each { |x|
          s = (0...len).collect { |i| a[y][x+i] }.join
          count += 1 if s == pat
        }
      }
      (0...size).each { |x|
        (0..size-len).each { |y|
          s = (0...len).collect { |i| a[y+i][x] }.join
          count += 1 if s == pat
        }
      }
    end
  end

  [a, startx, starty]
end

if __FILE__ == $0 then
  SIZE = 10

  # pat = '富豪家'
  # pat = '魑魅魍魎'
  (a, startx, starty) = chimimouryou('紅白饅頭',SIZE)
  
  puts startx
  puts starty
  
  (0...SIZE).each { |y|
    puts a[y].join
  }
end




