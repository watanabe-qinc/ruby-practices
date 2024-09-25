#!/usr/bin/env ruby
# frozen_string_literal: true

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

def sort_and_puts_directory_contents(devided_directory_contents, directory_contents)
  max_length = directory_contents.map(&:length).max

  devided_directory_contents.transpose.each do |transposed_directory_contents|
    puts transposed_directory_contents.map { |transposed_directory_content| transposed_directory_content.ljust(max_length, ' ') }.join(' ' * 5)
  end
end

sort_and_puts_directory_contents(devide_directory_contents(Dir.glob('*')), Dir.glob('*'))
