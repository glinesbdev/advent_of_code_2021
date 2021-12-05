# frozen_string_literal: true
# Check git history for original solution -- Modified for testability

# Bingo needs to be named something else here (Game) -- require might cache
# modules loaded into memory so it had to be a different name.
# I will probably need to split up the single RSpec file into
# different files...

require File.expand_path('../game', __FILE__)

class Day4Part1
  def run
    Game.play!
  end
end
