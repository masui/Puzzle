#
#	$Date: 2004/04/24 13:54:44 $
#	$Revision: 1.3 $
#

#
# 8:7:5の三角形のある頂点の角度はちょうど60度になる。
# こういうような整数比が他にもあるか調査してみる。
#
# 考えてみると、余弦定理より、辺の長さが整数比の三角形の頂点の角度の
# 余弦は必ず有理数になるはずで、時々それが1/2とか0のようなキリの良い値になるということ。
#

#
# GCM(a,b,c) = GCM(a,GCM(b,c))だと思うが...
#

def gcm(x,y) # x, yの最大公約数を計算
  while true do
    if y > x then
      z = y
      y = x
      x = z
    end
    break if y == 0
    while x >= y do
      # puts "#{x}, #{y}"
      x = x - y
    end
  end
  x
end

def cos(x,y,z) # 余弦定理からコサインを計算
  (x * x + y * y - z * z)/(2.0 * x * y)
end

def findcos(v)  # 整数比の三角形をすべてリスト
  (1..100).each { |x|
    (1..x).each { |y|
      (1..y).each { |z|
        next if x + y <= z # 三角形にならないものを排除
        next if x + z <= y
        next if y + z <= x
        next if gcm(x,gcm(y,z)) != 1 # GCMが2以上のものは除去
        if cos(z,x,y) == v || cos(x,y,z) == v || cos(y,z,x) == v then
          puts "-------#{x} #{y} #{z}------"
          puts cos(x,y,z)
          puts cos(z,x,y)
          puts cos(y,z,x)
        end
      }
    }
  }
end
  
findcos(0.5)   # 角度が60度になるものをさがす
#findcos(0.0) # 直角三角形をさがす

