#!/usr/bin/env ruby

require "optparse"
require "date"

opt = OptionParser.new

params = {m: Date.today.month, y: Date.today.year}

opt.on('-m [month]', Integer) {|v| params[:m] = v}
opt.on('-y [year]', Integer) {|v| params[:y] = v}

opt.parse!(ARGV)

month = params[:m]
year = params[:y]

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

puts "#{month}月 #{year}".center(20)
week = ["日", "月", "火", "水", "木", "金", "土"]
puts week.join(" ")

print "   " * first_day.wday
(first_day..last_day).each do |date|
  print date.day.to_s.center(3)
  if date.saturday?
    puts "\n"
  end 
end
