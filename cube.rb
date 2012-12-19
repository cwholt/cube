#!/usr/bin/env ruby
require "colorize" # gem install colorize
require "terminfo" # gem install ruby-terminfo

cube = %Q{
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

def enjoy(cube)
  offset, mode = 0, 1

  loop do

    # clear screen
    puts "\e[2J\e[f"

    # alter left/right modes -- allow for dynamic window width
    mode = 0 if offset == (TermInfo.screen_size[1] - cube.collect{|c| c.length }.max)
    mode = 1 if offset == 0

    # modify the offset
    offset = mode == 1 ? offset + 1 : offset - 1

    # only do the multiplication once.
    spacing = ' ' * offset

    # puts the cube w/ color!
    puts cube.collect{ |c| spacing + c }.join("\n").colorize(String.colors[offset % String.colors.length])

    # enjoy christmas cheer and sleep for a bit.
    sleep 0.0275

  end
end

enjoy(cube)