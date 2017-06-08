#!/usr/bin/env ruby
#
class Triangle
  def self.check(sides)
    error_message = '3辺の長さを正の整数で3つ指定してください'

    sides.each do |i|
      return error_message unless i =~ /^\d+$/
      return error_message unless i.to_i > 0
    end

    return error_message if sides.size != 3

    a, b, c = sides.map(&:to_i).sort

    return '三角形じゃないです＞＜' unless (a + b > c)
    return '正三角形ですね！' if (a === b && b === c)
    return '二等辺三角形ですね！' if (a === b || b === c)
    '不等辺三角形ですね！'
  end
end

if $0 == __FILE__
  p Triangle.check(ARGV)
end
