#!/usr/bin/env ruby

require 'digest/md5'

input = "iwrupvqb"

index = 1

zeroes = if ARGV[0] == "1"
           5
         else
           6
         end

zero_string = "0" * zeroes

loop do
  puts "On try #{index}" if index % 1000000 == 0

  digest = Digest::MD5.hexdigest("#{input}#{index}")

  if digest[0...zeroes] == zero_string
    puts "the answer is #{digest} #{index}"
    break
  end

  index += 1
end
