#!/usr/bin/env ruby
# frozen_string_literal: true

$VERBOSE = true

require 'prime'

max = (ARGV.empty? ? 1000 : ARGV[0].to_i)
primes = Prime.take_while { |prime| prime < max }
puts primes
