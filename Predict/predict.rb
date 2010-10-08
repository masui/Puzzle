#  p = Prediction.new(histlevel)
#  p.add('a')
#  p.add('b')
#  p.add('a')
#  p.predict ¢Í 'b'
#  p.add('b')
#  p.predict ¢Í 'a'
#  p.add('a')
#  p.predict ¢Í 'b'

class Prediction
  def initialize(level)
    @level = level
    @history = ''
    @accum = {}
    @tokens = {}
  end

  def add(c)
    @tokens[c] = true
    @history << c
    (1..@level).each { |len|
      s = @history[-len,len] # ºÇ¸å¤«¤élenÊ¸»ú
      @accum[s] = @accum[s].to_i + 1
    }
  end

  def predict
    res = []
    count = 0
    (1..@level).each { |i|
      s = @history[i-@level,@level-i]
      break if s.nil?
      @tokens.keys.each { |c|
        r = s+c
        if @accum[r] then
          if @accum[r] > count then
            count = @accum[r]
            res = [c]
          elsif @accum[r] == count then
            res << c
          end
        end
      }
      break if res != []
    }
    dump
    res
  end

  def dump
    @accum.each { |key,val|
      puts "#{key} => #{val}"
    }
  end
end

if __FILE__ == $0 then
  p = Prediction.new(4)
  p.add('a')
  p.add('b')
  p.add('a')
  puts p.predict
  exit
  p = Prediction.new(4)
  p.add('a')
  p.add('b')
  p.add('c')
  p.add('b')
  p.add('b')
  puts p.predict
  exit
  puts '----------'
  puts p.predict
  puts '----------'
  p.add('a')
  puts p.predict
  puts '----------'
  p.add('a')
  puts p.predict
  puts '--n--------'
  p.add('a')
  puts p.predict
  puts '----------'
end


