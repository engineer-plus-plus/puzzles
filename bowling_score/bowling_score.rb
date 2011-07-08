#!/usr/bin/env ruby

input = [[4,3],[10],[4,5],[1,3],[0,4],[2,5],[8,0],[9,1],[6,2],[2,3]]

output = [7, 26, 35, 39, 43, 50, 58, 74, 82, 87]

input = [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10, 10, 10]]

output = [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]

input = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,10,10]]

output = [0,0,0,0,0,0,0,0,0,30]

input = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
output = [0,0,0,0,0,0,0,0,0,0]
module Bowling

  def self.score(arr)
    result = []
    shots = arr.flatten
    s = 0
    while s < shots.length
      shot = shots[s]
      next_shot = shots[s+1]
      after_next_shot = shots[s+2]
      last_score = result[-1].nil? ? 0 : result[-1]
      if shot == 10
        unless next_shot.nil? or after_next_shot.nil? # reached last frame
          result << shot + next_shot + after_next_shot + last_score
          score_to_now = result.last
          s += 1
        else
          s += 1
        end
      elsif shot + next_shot == 10
        result << shot + next_shot + after_next_shot + last_score
        s += 2
      else
        result << shot + next_shot + last_score
        s += 2
      end
    end
    result
  end

end

my_output = Bowling::score(input)

(0..9).each do |i|
  puts "#{my_output[i] == output[i]}"
end
puts my_output.join(',')
puts output.join(',')
