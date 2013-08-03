#!/usr/bin/env ruby

require_relative 'spiral'

sp = Spiral.new

ary = sp.make_zeroed_array(ARGV[0].to_i)

STDOUT << sp.left_spiral(ary, ARGV[0].to_i)
