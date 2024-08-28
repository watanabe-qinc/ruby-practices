#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a

STRIKE = 10
point =
  frames.each_with_index.sum do |frame, index|
    if index <= 8
      frame.sum +
        if frame[0] == STRIKE
          if frames[index + 1][0] == STRIKE
            frames[index + 1][0] + frames[index + 2][0]
          else
            frames[index + 1].sum
          end
        elsif frame.sum == 10
          frames[index + 1][0]
        else
          0
        end
    else
      frame.sum
    end
  end
puts point
