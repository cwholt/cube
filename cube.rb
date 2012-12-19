#!/usr/bin/env ruby
require "colorize"

Cube = %Q{
  MERRY CHRISTMAS
     __________
    /|        /|
   / |       / |
  /__|______/  |
  |  |______|__|
  |  /      |  /
  | /       | /
  |/________|/
    #iMPULSE
}.split("\n")

def clear
  puts "\e[2J\e[f"
end

offset, mode = 0, 1

loop do
  clear
  
  mode = 0 if offset == 55
  mode = 1 if offset == 0
  
  offset = mode == 1 ? offset + 1 : offset - 1
  
  _cube = Cube.map do |c|
    ' ' * offset + c
  end
  
  puts _cube.join("\n").colorize(String.colors.shuffle.sample)
  sleep 0.0275
end
