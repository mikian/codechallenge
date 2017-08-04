#!/usr/bin/env ruby

require_relative './lib/parser'

parser = Parser.new(File.open(ARGV.shift)).parse
parser.result[:visits].each do |path, count|
  puts format('%20s %3d visits', path, count)
end

puts ''

parser.result[:unique].each do |path, count|
  puts format('%20s %3d unique views', path, count)
end
