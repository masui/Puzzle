#!/usr/bin/env ruby

require 'kconv'
$KCODE = 'euc-jp'

def chimimouryou(pat,size)
  d = pat.split(//)
  len = d.length

  #
  # �������ʸ�����Ѱ�
  #
  a =
     (0...size).collect { |y|
    (0...size).collect { |x|
      d[rand(len)]
    }
  }
  
  #
  # ������ʸ���󤬤ɤ����ˤʤ����򸡺������ߤĤ���������׻����ʤ�����
  # ���θ塢������ʸ�����������ǡ����줬��ˡ����Ǥ��뤳�Ȥ��ǧ���롣
  # �����������������ޤ������
  #
  
  count = 0
  while count != 1 do
    # puts "----------------"
    count = 0
    done = true
    #
    # ʸ����˥ޥå����뤫����������Х�������ִ���
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
      # ������ʾ���������ʸ�����������
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
      # ��ˡ������ɤ�������
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

  # pat = '�ٹ��'
  # pat = '�̥��'
  (a, startx, starty) = chimimouryou('�����Ƭ',SIZE)
  
  puts startx
  puts starty
  
  (0...SIZE).each { |y|
    puts a[y].join
  }
end



