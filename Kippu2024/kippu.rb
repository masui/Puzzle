#
# 切符問題
#
# % kippu 1 2 3 4
#

args = ARGV
exit if args.length != 4

def calc(stack, params, operators, history)
  if params.length == 0 && operators.length == 0
    if stack[stack.length-1] == 10.0
      p history
      return true
    else
      return false
    end
  end
  
  # 値をpushしてみる
  if params.length > 0
    paramsx = params.dup
    stackx = stack.dup
    historyx = history.dup
    param = paramsx.shift
    stackx.push(param)
    historyx.push(param)
    calc(stackx, paramsx, operators, historyx)
  end
  
  # operatorsの先頭のモノで演算してみる
  if stack.length >= 2
    operatorsx = operators.dup
    stackx = stack.dup
    historyx = history.dup
    operator = operatorsx.shift
    val1 = Float(stackx.pop)
    val2 = Float(stackx.pop)
    val = 'X'
    if operator == '+'
      val = val2 + val1
    elsif operator == '-'
      val = val2 - val1
    elsif operator == '*'
      val = val2 * val1
    elsif operator == '/'
      val = val2 / val1
    end
    stackx.push(val)
    
    historyx.push(operator)

    calc(stackx, params, operatorsx, historyx)
  end
end

checked = {} #計算ずみかどうか
args.permutation(4).each { |params|
  ['+','-','*','/'].repeated_permutation(3).each { |operators|
    unless checked[params.join(',')]
      res = calc([], params, operators, [])
      if res
        checked[params.join(',')] = true
      end
    end
  }
}
