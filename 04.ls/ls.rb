#!/usr/bin/env ruby
# frozen_string_literal: true

def make_ls_arrays(dir)
  directory_contents = dir

  column = 3
  if (directory_contents.length % column).zero?
    directory_contents.each_slice(directory_contents.length / column).to_a
  else
    directory_contents.each_slice(directory_contents.length / column + 1).to_a
  end
end

no_option_ls_arrays = make_ls_arrays(Dir.glob('*'))

def sort_ls_arrays(arrays)
  arrays.last << '' while arrays.last.length < arrays.first.length

  max_length = 0
  arrays.flatten.map do |character|
    character_length = character.length

    max_length = character_length if max_length < character_length
  end

  arrays.transpose.each do |array|
    list =
      array.map do |name|
        name.ljust(max_length, ' ')
      end
    puts list.join(' ' * 5)
  end
end

sort_ls_arrays(no_option_ls_arrays)
