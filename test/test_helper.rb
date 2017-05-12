$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "memcacher"

require "minitest/autorun"
require "simplecov"
SimpleCov.start
