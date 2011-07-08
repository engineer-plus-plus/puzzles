#!/usr/bin/env ruby

# Only have coins of value 1, 15, and 20
# For any amount n, what is the least amount of coins you need to sum
# to that amount?

if ARGV.length != 1
  puts "Usage: coins.rb <amount>"
  exit
end

amount = ARGV[0].to_i

arr = []
(0..amount).each do |i|
  if i == 0
    arr << 0
  else
    if i >= 20
      arr << [arr[i-1] + 1, arr[i-15] + 1, arr[i-20] + 1].min
    elsif i >= 15
      arr << [arr[i-1] + 1, arr[i-15] + 1].min
    else
      arr << arr[i-1] + 1
    end
  end
end

#arr.length.times do |i|
#  puts "For amount \t#{i}\trequires\t#{arr[i]}"
#end

puts arr[amount]
