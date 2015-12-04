#!/usr/bin/env ruby

require 'pp'

def build_visit_map(players = 1)
  visits = Hash.new { |h, k| h[k] = 0 }

  # starting location
  visits['0,0'] += 1

  index = 0
  player_positions = players.times.map { [0, 0] }

  input = File.read("input.txt").strip

  input.each_char do |move|
    current_player = index % players
    position = player_positions[current_player]

    case move
    when ">"
      position[0] += 1
    when "<"
      position[0] -= 1
    when "^"
      position[1] += 1
    when "v"
      position[1] -= 1
    else
      raise "WHAT"
    end

    visits[position.join(',')] += 1
    index += 1
  end

  visits
end

puts "Part 1: #{build_visit_map(1).size}"
puts "Part 2: #{build_visit_map(2).size}"
