#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

def devide_directory_contents(directory_contents)
  column = 3

  devided_directory_contents =
    if (directory_contents.length % column).zero?
      directory_contents.each_slice(directory_contents.length / column).to_a
    else
      directory_contents.each_slice(directory_contents.length / column + 1).to_a
    end

  devided_directory_contents.last << '' while devided_directory_contents.last.length < devided_directory_contents.first.length
  devided_directory_contents
end

def sort_directory_contents(directory_contents)
  max_length = directory_contents.map(&:length).max

  devide_directory_contents(directory_contents).transpose.map do |transposed_directory_contents|
    transposed_directory_contents.map { |transposed_directory_content| transposed_directory_content.ljust(max_length, ' ') }.join(' ' * 5)
  end
end

opt = OptionParser.new

options = {}
opt.on('-a') { |v| options[:a] = v }

opt.parse!(ARGV)

if options[:a]
  puts sort_directory_contents(Dir.glob('*', File::FNM_DOTMATCH))
else
  puts sort_directory_contents(Dir.glob('*'))
end
