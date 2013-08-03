#!/usr/bin/env ruby

require_relative 'spiral'

sp = Spiral.new

ary = sp.make_zeroed_array(ARGV[0].to_i)

sp.left_spiral(ary, ARGV[0].to_i).each do |row|
  STDOUT << row.collect { |i| i < 10 ? "0#{i}" : "#{i}"  }
  STDOUT << "\n"
end
